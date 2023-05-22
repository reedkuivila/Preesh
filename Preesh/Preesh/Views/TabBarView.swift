//
//  TabBarView.swift
//  Preesh
//
//  Created by reed kuivila on 5/18/23.
//

import SwiftUI

struct TabBarView: View {
    @State private var selectedTab = 0
    @Binding var optionSelected : Int
    
    var body : some View {
        ZStack(alignment: .top) {
            HorizontalView(optionSelected: self.$optionSelected)
                .padding()
                .padding(.horizontal, 22)
            Button(action: {
            }) {
                Image(systemName: "plus.circle").renderingMode(.original)
                    .padding(15)
                    .font(.system(size: 40))      }.background(Color.white)
                .clipShape(Circle())
                .offset(y: -32)
                .shadow(radius: 5)
        }.background(Color.white)
    }
}
    

struct HorizontalView : View {
    @Binding var optionSelected : Int
    
    var body : some View {
        VStack {
            HStack {
                Button(action: {
                    self.optionSelected = 0
                }) {
                    Image(systemName: "house")
                        .font(.system(size: 30))
                }.foregroundColor(self.optionSelected == 0 ? .blue : .gray)
                
                Spacer(minLength: 24)
                
                Button(action: {
                    
                    self.optionSelected = 1
                    
                }) {
                    
                    Image(systemName: "person")
                        .font(.system(size: 40))
                    
                }.foregroundColor(self.optionSelected == 1 ? .blue : .gray)
            }
        }
    }
}

struct TabBarPreviewView: View {
        
    var body: some View {
        
        VStack {
            Spacer()
            TabBarView(optionSelected:  .constant(0))
        }.background(Color(.gray).edgesIgnoringSafeArea(.top))
    }
}

struct TabBarPreviewView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarPreviewView()
    }
}
