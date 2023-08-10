//
//  Item.swift
//  Preesh2.0
//
//  Created by reed kuivila on 8/10/23.
//

import FirebaseFirestoreSwift
import Firebase

// TODO: need to add comments and bookmarks here!

struct Item: Identifiable, Decodable {
    @DocumentID var id: String?
    let caption: String
    let timestamp: Timestamp
    let uid: String
    var likes: Int
    
    var user: User?
}
