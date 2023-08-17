//
//  GiftRowViewModel.swift
//  Preesh2.0
//
//  Created by reed kuivila on 8/17/23.
//

import Foundation


class GiftRowViewModel: ObservableObject {
    let gift: Gift
    private let service = GiftService()
    
    init(gift: Gift) {
        self.gift = gift
    }
    
    func likeGift() {
        service.likeGift(gift)
    }
}
