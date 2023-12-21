//
//  ContentView.swift
//  Preesh2.0
//
//  Created by reed kuivila on 7/18/23.
//

import SwiftUI
import Kingfisher

struct ContentView: View {
    @State private var showMenu = false
    @State private var showExplore = false
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        Group {
            if viewModel.userSession == nil {
                // no user logged in, show login screen
                LoginView()
            } else {
                // user logged in, show main screen
//                mainScreenView
                LoginView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ContentView()
                .environmentObject(AuthViewModel())
        }
    }
}



extension ContentView {
    var mainScreenView: some View {
        NavigationStack {
            ZStack(alignment: .topLeading) {
                MainTabView()
                    .navigationBarHidden(showMenu)
                
                if showMenu {
                    ZStack {
                        Color(.black)
                            .opacity(showMenu ? 0.25 : 0.0)
                            .ignoresSafeArea()
                    }.onTapGesture {
                        withAnimation(.easeInOut) {
                            showMenu = false
                        }
                    }
                }
                SideBarView()
                    .frame(width: 300)
                    .offset(x: showMenu ? 0: -300, y:0)
                    .background(showMenu ? Color.white : Color.clear)
                
            }
            .toolbarBackground(.clear, for: .navigationBar)
            
            .toolbar {
                // MARK: side bar pop out
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        withAnimation(.easeInOut) {
                            showMenu.toggle()
                        }
                    } label: {
                        if let user = viewModel.currentUser {
                            KFImage(URL(string: user.profileImageUrl))
                                .resizable()
                                .scaledToFill()
                                .clipShape(Circle())
                                .frame(width: 32, height: 32)
                        } else {
                            Circle()
                            
                                .scaledToFill()
                                .clipShape(Circle())
                                .frame(width: 32, height: 32)
                        }
                    }
                }
                // MARK: search for users
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        withAnimation(.easeInOut) {
                            showExplore.toggle()
                        }
                    } label: {
                        Image(systemName: "magnifyingglass")
                    }
                    .fullScreenCover(isPresented: $showExplore) {
                          ExploreView()
                              .gesture(DragGesture().onChanged { value in
                                  // Detect the downward swipe gesture and close the ExploreView
                                  if value.translation.height > 100 {
                                      showExplore = false
                                  }
                              })
                      }
                }
            }
            .onAppear {
                showMenu = false
        }
        }
    }
}

