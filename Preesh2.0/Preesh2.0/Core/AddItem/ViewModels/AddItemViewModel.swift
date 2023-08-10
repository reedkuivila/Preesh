//
//  AddItemViewModel.swift
//  Preesh2.0
//
//  Created by reed kuivila on 8/10/23.
//

import Foundation


class AddItemViewModel: ObservableObject {
    @Published var didAddItem = false
    
    let service = ItemService()
    
    func addItem(withCaption caption: String) {
        service.uploadItem(caption: caption) { success in
            if success {
                // dismiss the add item view
                self.didAddItem = true
            } else {
                // show an error message to the user
                
            }
        }
    }
}
