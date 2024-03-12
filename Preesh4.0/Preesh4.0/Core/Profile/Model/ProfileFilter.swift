//
//  ProfileFilter.swift
//  Preesh4.0
//
//  Created by reed kuivila on 3/12/24.
//

import Foundation


enum ProfileFilter: Int, CaseIterable, Identifiable {
    case wishList
    case booksMarks
//    case likes
    
    
    var title: String {
        switch self {
        case .wishList: return "Wish List"
        case .booksMarks: return "Bookmarks"
//        case . likes: return "Likes"
        }
    }
    
    var id: Int { return self.rawValue}
}
