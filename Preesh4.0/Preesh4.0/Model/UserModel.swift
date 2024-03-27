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
//struct User: Identifiable {
//    var id: String?
//    let username: String
//    let fullname: String
//    let profileImageUrl: String
//    let email: String
//    
//    /// Checks is this user is the current authnticated user
////    var isCurrentUser: Bool { return Auth.auth().currentUser?.uid == id}
//}


// new struct for preesh 4.0 created on 3/27/24

struct User: Identifiable, Codable {
    let id: String
    let fullname: String
    let email: String
    let username: String
    var profileImageUrl: String?
    var bio: String?
}
