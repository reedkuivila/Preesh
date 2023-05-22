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
       
            
            if optionSelected == 0 {
                HomeFeedView()
            } else if optionSelected == 1 {
                ProfileView()
                    .padding(.bottom, -130)
            
            }
            
            Spacer()
            TabBarView(optionSelected: self.$optionSelected)
        }
//        .background(CustomColor.preeshBlue.edgesIgnoringSafeArea(.top))
        .shadow(radius:20)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
