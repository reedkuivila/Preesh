//
//  ContentView.swift
//  Preesh
//
//  Created by reed kuivila on 5/18/23.
//

import SwiftUI

struct ContentView: View {
    @State var optionSelected = 0

    var body: some View {
        VStack {
            Spacer()
            Image(systemName: "gift.fill")
                .font(.system(size: 40))
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Welcome to preesh!")
                .font(.system(size: 25))
            
            if optionSelected == 0 {
                HomeFeedView()
            } else if optionSelected == 1 {
                ProfileView()
            }
            
            Spacer()
            TabBarView(optionSelected: self.$optionSelected)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
