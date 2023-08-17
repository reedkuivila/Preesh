//
//  ItemService.swift
//  Preesh2.0
//
//  Created by reed kuivila on 8/10/23.
//


import Firebase

struct GiftService {
    
    // add whatever needs to be grabbed from DB in this func
    func uploadGift(caption: String, completion: @escaping(Bool) -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        let data = ["uid": uid,
                    "caption": caption,
                    "likes": 0,
                    "timestamp": Timestamp(date: Date())] as [String : Any]
        
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
}

