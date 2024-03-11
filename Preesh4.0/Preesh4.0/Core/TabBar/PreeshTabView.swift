//
//  PreeshTabView.swift
//  Preesh4.0
//
//  Created by reed kuivila on 3/11/24.
//

import SwiftUI

struct PreeshTabView: View {
    @State private var selectedTab = 0
    
    
    var body: some View {
        
        ZStack(alignment: .bottom) {
            TabView(selection: $selectedTab) {
                Text("Feed View")
                    .tabItem {
                        Image(systemName: selectedTab == 0 ? "house.fill" : "house")
                            .environment(\.symbolVariants, selectedTab == 0 ? .fill : .none)
                    }
                    .onAppear { selectedTab = 0 }
                    .tag(0)
                
                Text("Profile")
                    .tabItem {
                        Image(systemName: selectedTab == 1 ? "person.fill" : "person")
                            .environment(\.symbolVariants, selectedTab == 1 ? .fill : .none)
                    }
                    .onAppear { selectedTab = 1 }
                    .tag(1)
                
            }
            .tint(Color("preeshBlue"))
                
                Button {
                    // TODO: add showAddGiftView.toggle()
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
                //    .fullScreenCover(isPresented: $showAddGiftView) {
                //        NewGiftView(user: user)
                //    }
            
        }
    }
}



#Preview {
    PreeshTabView()
}
