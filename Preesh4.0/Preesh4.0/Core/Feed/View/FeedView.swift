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
//            ZStack(alignment: .topLeading) {
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
            
            

//                    .navigationBarHidden(showMenu)
//                
//                if showMenu {
//                    ZStack {
//                        Color(.black)
//                            .opacity(showMenu ? 0.25 : 0.0)
//                            .ignoresSafeArea()
//                    }.onTapGesture {
//                        withAnimation(.easeInOut) {
//                            showMenu = false
//                        }
//                    }
//                }
//                SideBarView()
//                    .frame(width: 300)
//                    .offset(x: showMenu ? 0: -300, y:0)
//                    .background(showMenu ? Color.white : Color.clear)
//                
//            }
            .toolbarBackground(.clear, for: .navigationBar)
            .navigationTitle("test: Gift Feed")
            .navigationBarTitleDisplayMode(.inline)
            
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        withAnimation(.easeInOut) {
                            showMenu.toggle()
                        }
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
