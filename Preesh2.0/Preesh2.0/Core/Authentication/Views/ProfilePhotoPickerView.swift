//
//  ProfilePhotoPickerView.swift
//  Preesh2.0
//
//  Created by reed kuivila on 8/4/23.
//

import SwiftUI

struct ProfilePhotoPickerView: View {
    var body: some View {
        VStack {
            AuthHeaderView(title1: "Add a photo.",
                           title2: "Click below to pick your image",
                           fontSize: 30)
            
            Button {
                print("Pick your profile picture")
            } label: {
                Image(systemName: "person.circle")
                    .resizable()
                    .foregroundColor(Color("preeshBlue"))
                    .frame(width: 180, height: 180)
                    .padding(.top)
            }
            
            Spacer()
        }
        .ignoresSafeArea()
    }
}

struct ProfilePhotoPickerView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePhotoPickerView()
    }
}
