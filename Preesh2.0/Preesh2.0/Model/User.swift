//
//  User.swift
//  Preesh2.0
//
//  Created by reed kuivila on 8/8/23.
//

// class to make a user object (OOP)
// make sure to add info to this object as we add features (bday, address, etc)

import FirebaseFirestoreSwift

struct User: Identifiable, Decodable {
    @DocumentID var id: String?
    let username: String
    let fullname: String
    let profileImageUrl: String
    let email: String
    
    
}
