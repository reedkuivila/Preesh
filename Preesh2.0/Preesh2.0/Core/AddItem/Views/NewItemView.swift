//
//  NewItemView.swift
//  Preesh2.0
//
//  Created by reed kuivila on 7/27/23.
//

import SwiftUI

struct NewItemView: View {
    @State private var caption = ""
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Cancel")
                        .foregroundColor(Color("preeshBlue"))
                }
                
                Spacer()
                
                Button {
                    print("Add item to list")
                } label: {
                    Text("Add item")
                        .bold()
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                        .background(Color("preeshBlue"))
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                }
            }
            .padding()
            
            HStack(alignment: .top) {
                Circle()
                    .frame(width: 64, height: 64)
                
                CustomTextField("hello", text: $caption)
            }
            .padding()
        }
    }
}

struct NewItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewItemView()
    }
}
