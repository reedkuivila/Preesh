//
//  UserService.swift
//  Preesh2.0
//
//  Created by reed kuivila on 8/8/23.
//

// fetch all user data from the database

import Firebase
import FirebaseFirestoreSwift

struct UserService {
    
    func fetchUser(withUid uid: String, completion: @escaping(User) -> Void) {
        Firestore.firestore().collection("users")
            .document(uid)
            .getDocument { snapshot, _ in
                guard let snapshot = snapshot else { return }
             
                guard let user = try? snapshot.data(as: User.self) else { return }
                completion(user)
                
                // print user info in the console to help debug & manage user sessions
                print("DEBUG: username is \(user.username)")
                print("DEBUG: email is \(user.email)")

                

            }
    }
    
    // fetches ALL users from the database, gets their documents from the "users" collection
    func fetchUsers(completion: @escaping([User]) -> Void) {
        var users = [User]()
        Firestore.firestore().collection("users")
            .getDocuments { snapshot, _ in
                guard let documents = snapshot?.documents else { return }
                // new code
                let users = documents.compactMap({ try? $0.data(as: User.self) })
                
//                documents.forEach { document in
//                    guard let user = try? document.data(as: User.self) else { return }
//                    users.append(user)
//                }
                
                completion(users)
            }
    }
}
