//
//  ContentView.swift
//  Preesh
//
//  Created by reed kuivila on 5/18/23.
//

import SwiftUI

struct ContentView: View {
    @State var optionSelected = 0
    @State public var didAuthenticateUser = false
    @State private var showSearch = false
    @State private var searchText = ""
    @EnvironmentObject var viewModel: AuthViewModel

    
    var body: some View {
        Group {
            // no user logged in
            if $viewModel.userSession == nil {
                LoginView()
            } else {
                // have a logged in user
                mainInterfaceView
            }
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

    
extension ContentView {
    var mainInterfaceView: some View {
        VStack {
            
            if optionSelected == 0 {
                HomeFeedView()
            } else if optionSelected == 1 {
                ProfileView()
                    .padding(.bottom, -130)
                
            } else {
                SearchView(searchText: $searchText)
            }
            
            
            Spacer()
            TabBarView(optionSelected: self.$optionSelected)
        }
        .shadow(radius:20)
        
    }
    
}
