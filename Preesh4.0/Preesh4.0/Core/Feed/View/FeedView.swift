//
//  FeedView.swift
//  Preesh4.0
//
//  Created by reed kuivila on 3/11/24.
//

import SwiftUI

struct FeedView: View {
    @State private var showExplore = false
    @State private var showMenu = false
    
    var body: some View {
        
        NavigationStack {
            ScrollView(showsIndicators: false) {
                LazyVStack {
                    ForEach(0...10, id: \.self) { gift in
                        GiftCell()
                    }
                }
                .refreshable {
                    print("DEBUG: refresh gift feed")
                }
            }
            .toolbarBackground(.clear, for: .navigationBar)
            .navigationTitle("Gift Feed")
            .navigationBarTitleDisplayMode(.inline)
            
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        // TODO: add side menu functionality
                        
                    } label: {
                        CircularProfileImageView(picWidth: 20, picHeight: 20)
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
