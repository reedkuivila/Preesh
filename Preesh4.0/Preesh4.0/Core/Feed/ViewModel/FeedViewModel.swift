//
//  FeedViewModel.swift
//  Preesh4.0
//
//  Created by reed kuivila on 4/5/24.
//

import Foundation

@MainActor
class FeedViewModel: ObservableObject {
    @Published var gifts = [Gift]()
    
    init() {
        Task { try await fetchGifts() }
    }
    
    func fetchGifts() async throws {
        self.gifts = try await GiftService.fetchGifts()
        try await fetchUserDataForGifts()
    }
    
    private func fetchUserDataForGifts() async throws {
        for i in 0 ..< gifts.count {
            let gift = gifts[i]
            let ownerUid = gift.ownerUid
            let giftUser = try await UserService.fetchUser(withUid: ownerUid)
            
            gifts[i].user = giftUser
        }
    }
}
