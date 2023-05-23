//
//  UserModel.swift
//  Preesh
//
//  Created by reed kuivila on 5/23/23.
//

import FirebaseFirestoreSwift
import Firebase

struct User: Identifiable, Decodable {
    @DocumentID var id: String?
    let username: String
    let fullname: String
    let profileImageUrl: String?
    let email: String
}

extension User {
    var avatarUrl: String {
        profileImageUrl ?? "MontourProfile"
    }
        
    var isCurrentUser: Bool {
        Auth.auth().currentUser?.uid == id
    }
}

