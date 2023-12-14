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
    var imageUrl: String?
    var giftUrl: String?
    var giftDetails: String?
    var giftPrice: String?
    var giftSpecifications: String?
    var giftNotes: String?
    
    /// User who posted the gift
    var user: User?
    
    /// Indicates whether the current user has liked someone elses post
    var didLike: Bool? = false
}


extension Gift {
    static let sampleUser = User(
        id: "user123",
        username: "sampleUser",
        fullname: "Jordan Montour",
        profileImageUrl: "https://example.com/profile.jpg",
        email: "mungus@mungo.edu"
    )

    static let giftSample = Gift(
        id: "gift123",
        caption: "Elegant Wristwatch",
        timestamp: Timestamp(date: Date()),
        uid: "user123",
        likes: 42,
        imageUrl: "https://example.com/image.jpg",
        giftUrl: "https://example.com/gift",
        giftDetails: "A luxurious wristwatch perfect for all occasions.",
        giftPrice: "$250",
        giftSpecifications: "Water-resistant, Quartz movement, Sapphire crystal",
        giftNotes: "Ideal gift for watch enthusiasts.",
        user: sampleUser,
        didLike: true
    )
}
