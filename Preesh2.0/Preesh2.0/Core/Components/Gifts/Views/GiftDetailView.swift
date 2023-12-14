//
//  GiftDetailView.swift
//  Preesh2.0
//
//  Created by reed kuivila on 12/14/23.
//

import SwiftUI
import Kingfisher

struct GiftDetailView: View {
    @ObservedObject var viewModel: GiftRowViewModel
    
    init(gift: Gift) {
        self.viewModel = GiftRowViewModel(gift: gift)
    }
    
    var body: some View {
        
        VStack {
            // MARK: Gift image
            if let imageUrl = viewModel.gift.imageUrl, let url = URL(string: imageUrl) {
                      KFImage(url)
                          .resizable()
                          .scaledToFit()
                          .frame(height: 200) // Adjust the frame as needed
                  } else {
                      Image(systemName: "questionmark.square") // System placeholder image
                          .resizable()
                          .scaledToFit()
                          .frame(height: 200) // Adjust the frame as needed
                          .foregroundColor(.gray)
                  }
            
            // MARK: gift name (caption)

            Text(viewModel.gift.caption)
            
            // MARK: gift url
            if let giftUrl = viewModel.gift.giftUrl {
                Text(giftUrl)
            } else {
                Text("No URL")
            }
            
            // MARK: gift price
            if let giftPrice = viewModel.gift.giftPrice {
                Text(giftPrice)
            } else {
                Text("No Price")
            }
            
            // MARK: gift specifications
            if let giftSpecs = viewModel.gift.giftSpecifications {
                Text(giftSpecs)
            } else {
                Text("no specifications")
            }
            
            // MARK: gift details and notes
            if let giftDetails = viewModel.gift.giftNotes {
                Text(giftDetails)
            } else {
                Text("No Details")
            }
            
           
        }
    }
}


struct GiftDetailView_Previews: PreviewProvider {
    static var previews: some View {
        GiftDetailView(gift: .giftSample)
    }
}
