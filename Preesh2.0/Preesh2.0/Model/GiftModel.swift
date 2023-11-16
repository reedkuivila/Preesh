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


/// Represents indivudla Gift that a user can add to their lists
struct Gift: Identifiable, Decodable {
    @DocumentID var id: String?
    let caption: String
    let timestamp: Timestamp
    let uid: String
    var likes: Int
    
    /// User who posted the gift
    var user: User?
    
    /// Indicates whether the current user has liked someone elses post
    var didLike: Bool? = false
}
