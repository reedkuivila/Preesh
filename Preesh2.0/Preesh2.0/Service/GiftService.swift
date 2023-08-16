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
        Firestore.firestore().collection("gifts").getDocuments { snapshot, error in
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
}

