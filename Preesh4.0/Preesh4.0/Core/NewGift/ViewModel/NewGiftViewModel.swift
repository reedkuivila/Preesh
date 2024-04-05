//
//  NewGiftViewModel.swift
//  Preesh4.0
//
//  Created by reed kuivila on 4/5/24.
//

import Foundation
import Firebase

class NewGiftViewModel: ObservableObject {
//    @Published var giftName = ""
//    @Published var giftLink: String? = nil
//    @Published var giftCost: String? = nil
//    @Published var giftSpecs: String? = nil
//    @Published var giftNotes: String? = nil
    
    func uploadGift(giftName: String) async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let gift = Gift(
            ownerUid: uid,
            giftName: giftName,
            timestamp: Timestamp(),
            likes: 0
//            giftLink: giftLink,
//            giftCost: giftCost,
//            giftSpecs: giftSpecs,
//            giftNotes: giftNotes
        )
        
        try await GiftService.uploadGift(gift)
    }
}
