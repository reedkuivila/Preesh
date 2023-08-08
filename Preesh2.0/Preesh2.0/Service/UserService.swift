//
//  UserService.swift
//  Preesh2.0
//
//  Created by reed kuivila on 8/8/23.
//

// fetch all user data from the database

import Firebase

struct UserService {
    
    func fetchUser(withUid uid: String) {
        Firestore.firestore().collection("users")
            .document(uid)
            .getDocument { snapshot, _ in
                guard let data = snapshot?.data() else { return }
             
                print("DEBUG: user data is \(data)")

            }
    }
}
