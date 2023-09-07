//
//  ProfileViewModel.swift
//  Preesh2.0
//
//  Created by reed kuivila on 8/17/23.
//

import Foundation

class ProfileViewModel: ObservableObject {
    @Published var gifts = [Gift]()
    @Published var likedGifts = [Gift]()
    
    private let service = GiftService()
    private let userService = UserService()
    let user: User
    
    init(user: User) {
        self.user = user
        self.fetchUserGifts()
        self.fetchLikedGifts()
    }
    
    var actionButtonTitle: String {
        return user.isCurrentUser ? "Edit Profile" : "Add Friend"
    }
    
    func gifts(forFilter filter: ItemFilterViewModel) -> [Gift] {
        switch filter {
        case .wishList:
            return gifts
//        case .savedItems:
//            return gifts
        case .likedItems:
            return likedGifts
        }
    }
    
    func fetchUserGifts() {
        guard let uid = user.id else { return }
        service.fetchGifts(forUid: uid) { gifts in
            self.gifts = gifts
            
            for i in 0 ..< gifts.count {
                self.gifts[i].user = self.user
            }
        }
    }
    
    func fetchLikedGifts() {
        print("\(self.user.fullname) has liked  \(self.likedGifts.count) gifts")
        guard let uid = user.id else { return }
        
        service.fetchLikedGifts(forUid: uid) { gifts in
            self.likedGifts = gifts
            
            for i in 0 ..< gifts.count {
                let uid = gifts[i].uid
                    
                self.userService.fetchUser(withUid: uid) { user in
                    self.likedGifts[i].user = user
                }
            }
        }
    }
}
