//
//  FeedFilterViewModel.swift
//  Preesh2.0
//
//  Created by reed kuivila on 10/17/23.
//

import Foundation


enum FeedFilterViewModel: Int, CaseIterable {
    case friends
    case discoverItems
    
    var title: String {
        switch self {
        case .friends: return "Friends"
        case .discoverItems: return "Discover"
        default: return "Unknown"
        }
    }
}

