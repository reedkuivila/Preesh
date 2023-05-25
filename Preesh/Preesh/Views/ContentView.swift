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
    
    var body: some View {
        VStack {
            
            if optionSelected == 0 {
                HomeFeedView()
            } else if optionSelected == 1 {
                ProfileView()
                    .padding(.bottom, -130)
                
            }
            
            
            Spacer()
            TabBarView(optionSelected: self.$optionSelected)
        }
        .shadow(radius:20)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
