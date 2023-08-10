//
//  FeedViewMode.swift
//  Preesh2.0
//
//  Created by reed kuivila on 8/10/23.
//

import Foundation

class FeedViewModel: ObservableObject {
    @Published var items = [Item]()
    let service = ItemService()
    
    init() {
        fetchItems()
    }
    
    func fetchItems() {
        service.fetchItems { items in
            self.items = items
        }
    }
}
