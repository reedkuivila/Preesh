//
//  FeedView.swift
//  Preesh4.0
//
//  Created by reed kuivila on 3/11/24.
//

import SwiftUI
import Firebase

struct FeedView: View {
    @StateObject var viewModel = FeedViewModel()
    
    @State private var showExplore = false
    @State private var showMenu = false
    
    var body: some View {
        
        NavigationStack {
            ScrollView(showsIndicators: false) {
                LazyVStack {
                    ForEach(viewModel.gifts) { gift in
                        GiftCell(gift: gift)
                    }
                }
            }
            .refreshable {
                Task { try await viewModel.fetchGifts() }
                print("DEBUG: refresh gift feed")
            }
            .toolbarBackground(.clear, for: .navigationBar)
            .navigationTitle("Gift Feed")
            .navigationBarTitleDisplayMode(.inline)
            
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        // TODO: add side menu functionality
                        
                    } label: {
                        CircularProfileImageView(user: nil, size: .small)
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        withAnimation(.easeOut) {
                            showExplore.toggle()
                        }
                    } label: {
                        Image(systemName: "magnifyingglass")
                    }
                    .sheet(isPresented: $showExplore) {
                        ExploreView()
                    }
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        FeedView()
    }
}
