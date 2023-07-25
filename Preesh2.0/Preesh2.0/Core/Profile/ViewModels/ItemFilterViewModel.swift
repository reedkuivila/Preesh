//
//  ItemFilterViewModel.swift
//  Preesh2.0
//
//  Created by reed kuivila on 7/21/23.
//

import Foundation

enum ItemFilterViewModel: Int, CaseIterable {
    case wishList
    case savedItems
    
    var title: String {
        switch self {
        case .wishList: return "Wish List"
        case .savedItems: return "Saved Items"
        }
    }
}
