//
//  MainTabView.swift
//  Preesh2.0
//
//  Created by reed kuivila on 7/20/23.
//

import SwiftUI

struct MainTabView: View {
    @State private var selectedIndex = 0
    var body: some View {
        TabView(selection: $selectedIndex) {
            FeedView()
                .onTapGesture {
                    self.selectedIndex = 0
                }
                .tabItem {
                    Image(systemName: "house")
                }.tag(0)
            
            SearchView()
                .onTapGesture {
                    self.selectedIndex = 1
                }
                .tabItem {
                    Image(systemName: "plus.circle")
                }.tag(1)
            
            ProfileView()
                .onTapGesture {
                    self.selectedIndex = 2
                }
                .tabItem {
                    Image(systemName: "person")
                }.tag(2)
        }
        

    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
