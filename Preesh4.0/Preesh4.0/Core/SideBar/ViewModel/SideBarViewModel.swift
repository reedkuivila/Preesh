//
//  SideBarViewModel.swift
//  Preesh4.0
//
//  Created by reed kuivila on 3/13/24.
//


import Foundation

enum SideBarViewModel: Int, CaseIterable {
    case profile
    case friends
    case bookmarks
    case search
    case logout
    
    var title: String {
        switch self {
        case .profile: return "Proifile"
        case .friends: return "Friends"
        case .bookmarks: return "Bookmarks"
        case .search: return "Search"
        case .logout: return "Logout"
        }
    }
    
    var imageName: String {
        switch self {
        case .profile: return "person"
        case .friends: return "person.2"
        case .bookmarks: return "bookmark"
        case .search: return "magnifyingglass"
        case .logout: return "arrow.left.square"
            
        }
    }
}
