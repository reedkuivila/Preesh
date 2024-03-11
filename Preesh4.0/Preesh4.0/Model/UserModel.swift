//
//  UserModel.swift
//  Preesh4.0
//
//  Created by reed kuivila on 3/11/24.
//

//import FirebaseFirestoreSwift
//import Firebase
import Foundation

/// Represents an individual Preesh user
struct User: Identifiable {
    var id: String?
    let username: String
    let fullname: String
    let profileImageUrl: String
    let email: String
    
    /// Checks is this user is the current authnticated user
//    var isCurrentUser: Bool { return Auth.auth().currentUser?.uid == id}
}
