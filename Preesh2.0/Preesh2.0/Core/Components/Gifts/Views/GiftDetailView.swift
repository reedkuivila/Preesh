//
//  GiftDetailView.swift
//  Preesh2.0
//
//  Created by reed kuivila on 12/14/23.
//

import SwiftUI

struct GiftDetailView: View {
    @ObservedObject var viewModel: GiftRowViewModel
    
    init(gift: Gift) {
        self.viewModel = GiftRowViewModel(gift: gift)
    }
    
    var body: some View {
        
        VStack {
            Text(viewModel.gift.caption)
            
            if let giftUrl = viewModel.gift.giftUrl {
                Text(giftUrl)
            } else {
                Text("No URL")
            }
            
            if let giftDetails = viewModel.gift.giftDetails {
                Text(giftDetails)
            } else {
                Text("No Details")
            }
            
            if let giftPrice = viewModel.gift.giftPrice {
                Text(giftPrice)
            } else {
                Text("No Price")
            }
        }
    }
}


struct GiftDetailView_Previews: PreviewProvider {
    static var previews: some View {
        GiftDetailView(gift: .giftSample)
    }
}
