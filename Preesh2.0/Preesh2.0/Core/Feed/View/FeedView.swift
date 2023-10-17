//
//  FeedView.swift
//  Preesh2.0
//
//  Created by reed kuivila on 7/18/23.
//

import SwiftUI
import Kingfisher

struct FeedView: View {
    @State private var selectedFilter: FeedFilterViewModel = .friends
    @State private var showAddGiftView = false
    @ObservedObject var viewModel = FeedViewModel()
    @Namespace var animation
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ScrollView {
                LazyVStack {
                    filterView
                    ForEach(viewModel.gifts) { gift in
                        GiftRowView(gift: gift)
                    }
                }
            }
            .refreshable {
                viewModel.fetchGifts()
                // viewModel.fetch........
            }
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}


extension FeedView {
    
    // filter header bar
    var filterView: some View {
        HStack {
            ForEach(FeedFilterViewModel.allCases, id: \.rawValue) { option in
                VStack {
                    Text(option.title)
                        .font(.subheadline)
                        .fontWeight(selectedFilter == option ? .semibold : .regular)
                        .foregroundColor(selectedFilter == option ? Color("preeshBlue") : .gray)
                    
                    if selectedFilter == option {
                        Capsule()
                            .foregroundColor(Color("preeshBlue"))
                            .frame(height: 3)
                            .matchedGeometryEffect(id: "filter", in: animation)
                        
                    } else {
                        Capsule()
                            .foregroundColor(Color(.clear))
                            .frame(height: 3)
                        
                    }
                }
                .onTapGesture {
                    withAnimation(.easeInOut) {
                        self.selectedFilter = option
                    }
                }
            }
        }
        .overlay(Divider().offset(x: 0, y: 16))
    }
}
