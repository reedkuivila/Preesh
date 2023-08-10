//
//  ItemService.swift
//  Preesh2.0
//
//  Created by reed kuivila on 8/10/23.
//

import Firebase


struct ItemService {
    
    // add whatever needs to be grabbed from DB in this func
    func uploadItem(caption: String, completion: @escaping(Bool) -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        let data = ["uid": uid,
                    "caption": caption,
                    "liked": 0,
                    "timestamp": Timestamp(date: Date())] as [String : Any]
        
        Firestore.firestore().collection("items").document()
            .setData(data) { error in
                if let error = error {
                    print("DEBUG: failed to add item with error: \(error.localizedDescription)")
                    completion(false)
                    return
                }
                completion(true)
            }
    }
    
    func fetchItems(completion: @escaping([Item]) -> Void) {
        Firestore.firestore().collection("items").getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            let items = documents.compactMap({ try? $0.data(as: Item.self) })
            completion(items)
        }
    }
}

