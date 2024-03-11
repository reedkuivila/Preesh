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
            .navigationTitle("Gift Feed")
            .navigationBarTitleDisplayMode(.inline)
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    
                } label: {
                    Image(systemName: "person")
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
                .fullScreenCover(isPresented: $showExplore) {
                    ExploreView()
                        .gesture(DragGesture().onChanged { value in
                            if value.translation.height > 100 {
                                showExplore = false
                            }
                        })
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
