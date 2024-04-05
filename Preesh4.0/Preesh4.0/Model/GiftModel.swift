//
//  ThreadModel.swift
//  Preesh4.0
//
//  Created by reed kuivila on 4/5/24.
//

import Firebase
import FirebaseFirestoreSwift

///NB: any time something is going to be displayed in a list we
/// want it to be identifiable
struct Gift: Identifiable, Codable {
    @DocumentID var giftId: String?
    
    let ownerUid: String
    let giftName: String
    let timestamp: Timestamp
    var likes: Int /// NB: number of likes can change so it must be a var rather than a "let" constant

    // all optional fields in add gift view
//    var giftLink: String?
//    var giftCost: String?
//    var giftSpecs: String?
//    var giftNotes: String?
    
    // get the user ID that the gift is attached to
    var id: String {
        return giftId ?? NSUUID().uuidString
    }
    
    // need each gift attached to a user
    var user: User?
}
