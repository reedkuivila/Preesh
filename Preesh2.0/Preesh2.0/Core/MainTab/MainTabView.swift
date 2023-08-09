//
//  MainTabView.swift
//  Preesh2.0
//
//  Created by reed kuivila on 7/20/23.
//


import SwiftUI

struct MainTabView: View {
    @State private var selectedIndex = 0
    @State private var showAddItemView = false
    @EnvironmentObject var authViewModel: AuthViewModel

    var body: some View {
        if let user = authViewModel.currentUser {
            ZStack(alignment: .bottom) {
                TabView(selection: $selectedIndex) {
                    FeedView()
                        .onTapGesture {
                            self.selectedIndex = 0
                        }
                        .tabItem {
                            Image(systemName: "house")
                        }.tag(0)
                    
                    
                    ProfileView(user: user)
                        .onTapGesture {
                            self.selectedIndex = 2
                        }
                        .tabItem {
                            Image(systemName: "person")
                        }.tag(2)
                    
                }
                
                Button {
                    showAddItemView.toggle()
                    print("search for an item")
                } label: {
                    Image(systemName: "plus")
                        .resizable()
                        .renderingMode(.template)
                        .frame(width: 28, height: 28)
                        .padding()
                }
                .background(Color("preeshBlue"))
                .foregroundColor(.white)
                .clipShape(Circle())
                .offset(y: -2)
                .padding()
                .fullScreenCover(isPresented: $showAddItemView) {
                    NewItemView()
                }
            }
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
            .environmentObject(AuthViewModel())
    }
}
