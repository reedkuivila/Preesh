//
//  GiftRowViewModel.swift
//  Preesh2.0
//
//  Created by reed kuivila on 8/17/23.
//

import Foundation

class GiftRowViewModel: ObservableObject {
    @Published var gift: Gift
    private let service = GiftService()
    
    init(gift: Gift) {
        self.gift = gift
        checkIfUserLikedGift()
    }
    
    func likeGift() {
        service.likeGift(gift) { _ in
            self.gift.didLike = true
        }
    }
    
    func unlikeGift() {
        service.unlikeGift(gift) {
            self.gift.didLike = false
        }
    }
    
    func checkIfUserLikedGift() {
        service.checkIfUserLikedGift(gift) { didLike in
            if didLike {
                self.gift.didLike = true
            }
        }
    }
}
