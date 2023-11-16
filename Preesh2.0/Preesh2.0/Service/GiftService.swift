//
//  ItemService.swift
//  Preesh2.0
//
//  Created by reed kuivila on 8/10/23.
//


import Firebase

struct GiftService {
    
    // add whatever needs to be grabbed from DB in this func
    func uploadGift(caption: String, giftUrl: String, completion: @escaping(Bool) -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        let data = ["uid": uid,
                    "caption": caption,
                    "likes": 0,
                    "timestamp": Timestamp(date: Date()),
                    "giftUrl": giftUrl // Add the gift URL
        ] as [String : Any]
                
        Firestore.firestore().collection("gifts").document()
            .setData(data) { error in
                if let error = error {
                    print("DEBUG: failed to add gift with error: \(error.localizedDescription)")
                    completion(false)
                    return
                }
                completion(true)
            }
    }
    
    func fetchGifts(completion: @escaping([Gift]) -> Void) {
        Firestore.firestore().collection("gifts")
            .order(by: "timestamp", descending: true)
            .getDocuments { snapshot, error in
                if let error = error {
                    print("Error fetching gifts: \(error.localizedDescription)")
                    completion([])
                    return
                }
                
                guard let documents = snapshot?.documents else {
                    print("No documents found")
                    completion([])
                    return
                }
                
                let gifts = documents.compactMap({ try? $0.data(as: Gift.self) })
                print("\(gifts.count) items successfully fetched")
                completion(gifts)
            }
    }
    
    // only give back tweets that are equal to the user profile UID
    func fetchGifts(forUid uid: String, completion: @escaping([Gift]) -> Void) {
        Firestore.firestore().collection("gifts")
            .whereField("uid", isEqualTo: uid)
            .getDocuments { snapshot, _ in
                guard let documents = snapshot?.documents else { return }
                let gifts = documents.compactMap({ try? $0.data(as: Gift.self) })
                completion(gifts.sorted(by: { $0.timestamp.dateValue() > $1.timestamp.dateValue()}))
            }
    }
}

// MARK: bookmark/save friend's gifts

extension GiftService {
    
}

// MARK: liking gift functions

extension GiftService {
    func likeGift(_ gift: Gift, completion: @escaping(Bool) -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        guard let giftId = gift.id else { return }
        
        let userLikesRef = Firestore.firestore().collection("users")
            .document(uid)
            .collection("user-likes")
        
        Firestore.firestore().collection("gifts").document(giftId)
            .updateData(["likes": gift.likes + 1]) { _ in
                userLikesRef.document(giftId).setData([:]) { _ in
                    completion(true)
                }
            }
    }
    
    func unlikeGift(_ gift: Gift, completion: @escaping() -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        guard let giftId = gift.id else { return }
        guard gift.likes > 0 else { return }
        
        let userLikesRef = Firestore.firestore().collection("users").document(uid).collection("user-likes")
        
        Firestore.firestore().collection("gifts").document(giftId)
            .updateData(["likes": gift.likes - 1]) { _ in
                userLikesRef.document(giftId).delete { _ in
                    completion()
                }
            }
    }
    
    func checkIfUserLikedGift(_ gift: Gift, completion: @escaping(Bool) -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        guard let giftId = gift.id else { return }
        
        Firestore.firestore().collection("users")
            .document(uid)
            .collection("user-likes")
            .document(giftId).getDocument { snapshot, _ in
                guard let snapshot = snapshot else { return }
                completion(snapshot.exists)
            }
    }
    
    func fetchLikedGifts(forUid uid: String, completion: @escaping([Gift]) -> Void) {
        var gifts = [Gift]()
        
        Firestore.firestore().collection("users")
            .document(uid)
            .collection("user-likes")
            .getDocuments { snapshot, _ in
                guard let documents = snapshot?.documents else { return }
                
                documents.forEach { doc in
                    let giftID = doc.documentID
                    
                    Firestore.firestore().collection("gifts")
                        .document(giftID)
                        .getDocument { snapshot, _ in
                            guard let gift = try? snapshot?.data(as: Gift.self) else { return }
                            gifts.append(gift)
                            
                            completion(gifts)
                        }
                }
            }
    }
}
