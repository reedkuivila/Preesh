//
//  ItemFilterViewModel.swift
//  Preesh
//
//  Created by reed kuivila on 5/25/23.
//

import Foundation

enum ItemFilterViewModel: Int, CaseIterable {
    case bday
    case saved
    
    
    var title: String {
        switch self {
        case .bday: return "Birthday List"
        case .saved: return "Saved Items"
        }
    }
}
