//
//  ProfileViewModel.swift
//  Preesh2.0
//
//  Created by reed kuivila on 8/17/23.
//

import Foundation

class ProfileViewModel: ObservableObject {
    @Published var gifts = [Gift]()
    private let service = GiftService()
    let user: User
    
    init(user: User) {
        self.user = user
        self.fetchUserGifts()
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
}
