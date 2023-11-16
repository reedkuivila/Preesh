//
//  User.swift
//  Preesh2.0
//
//  Created by reed kuivila on 8/8/23.
//


// TODO: make sure to add info to this object as we add features (bday, address, etc)

import FirebaseFirestoreSwift
import Firebase

/// Represents an individual Preesh user
struct User: Identifiable, Decodable {
    @DocumentID var id: String?
    let username: String
    let fullname: String
    let profileImageUrl: String
    let email: String
    
    /// Checks is this user is the current authnticated user
    var isCurrentUser: Bool { return Auth.auth().currentUser?.uid == id}
}
