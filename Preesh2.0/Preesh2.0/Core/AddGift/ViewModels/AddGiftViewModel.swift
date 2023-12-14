//
//  AddItemViewModel.swift
//  Preesh2.0
//
//  Created by reed kuivila on 8/10/23.
//

import Foundation


class AddGiftViewModel: ObservableObject {
    @Published var didAddGift = false
    
    let service = GiftService()
    
    func addGift(withCaption caption: String, giftUrl: String, giftDetails: String, giftPrice: String, giftSpecifications: String, giftNotes: String) {
        service.uploadGift(caption: caption,
                           giftUrl: giftUrl,
                           giftDetails: giftDetails,
                           giftPrice: giftPrice,
                           giftSpecifications: giftSpecifications,
                           giftNotes: giftNotes) { success in
            if success {
                // dismiss the add item view
                self.didAddGift = true
            } else {
                // show an error message to the user
                
            }
        }
    }
}
    
//
//    func checkForSharedData() {
//        let userDefaults = UserDefaults(suiteName: "group.preesh2")
//        if let sharedCaption = userDefaults?.string(forKey: "sharedCaption") {
//            // Use sharedCaption as the caption for the new gift
//            addGift(withCaption: sharedCaption)
//            // Clear the shared caption after using it
//            userDefaults?.removeObject(forKey: "sharedCaption")
//        }
//    }
//}
