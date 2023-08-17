//
//  FeedView.swift
//  Preesh2.0
//
//  Created by reed kuivila on 7/18/23.
//

import SwiftUI

struct FeedView: View {
    @State private var showAddGiftView = false
    @ObservedObject var viewModel = FeedViewModel()
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ScrollView {
                LazyVStack {
                    ForEach(viewModel.gifts) { gift in
                        GiftRowView(gift: gift)
                            
                    }
                }
            }
            .refreshable {
                viewModel.fetchGifts()
            }
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
