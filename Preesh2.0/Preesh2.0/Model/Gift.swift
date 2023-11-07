//
//  Item.swift
//  Preesh2.0
//
//  Created by reed kuivila on 8/10/23.
//

import Foundation
import FirebaseFirestoreSwift
import Firebase

// TODO: need to add news feed comments and bookmarks here!

struct Gift: Identifiable, Decodable {
    @DocumentID var id: String?
    let caption: String
    let timestamp: Timestamp
    let uid: String
    var likes: Int
    
    var user: User?
    var didLike: Bool? = false
}
