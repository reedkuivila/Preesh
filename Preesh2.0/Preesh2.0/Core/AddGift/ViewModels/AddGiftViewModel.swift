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
    
    func addGift(withCaption caption: String) {
        service.uploadGift(caption: caption) { success in
            if success {
                // dismiss the add item view
                self.didAddGift = true
            } else {
                // show an error message to the user
                
            }
        }
    }
}
