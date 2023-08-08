//
//  ProfilePhotoPickerView.swift
//  Preesh2.0
//
//  Created by reed kuivila on 8/4/23.
//

import SwiftUI

struct ProfilePhotoPickerView: View {
    @State private var showPhotoPicker = false
    @State private var selectedImage: UIImage?
    @State private var profileImage: Image?
    
    var body: some View {
        VStack {
            AuthHeaderView(title1: "Add a photo.",
                           title2: "Click the icon to pick your image",
                           fontSize: 30)
            
            Button {
                showPhotoPicker.toggle()
                print("Pick your profile picture")
            } label: {
                if let profileImage = profileImage {
                    profileImage
                        .resizable()
                        .modifier(ProfilePhotoModifier())
                    
                } else {
                    Image(systemName: "person.circle")
                        .resizable()
                        .modifier(ProfilePhotoModifier())
                }
            }
            .sheet(isPresented: $showPhotoPicker,
                   onDismiss: loadImage) {
                ImagePicker(selectedImage: $selectedImage)
            }
            .padding(.top, 44)
            
            if profileImage != nil {
                Button {
                    print("DEBUG: user registration complete")
                } label: {
                    Text("Continue")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 340, height: 50)
                        .background(Color("preeshBlue"))
                        .clipShape(Capsule())
                        .padding()
                }
            }

            Spacer()
        }
        .ignoresSafeArea()
    }
    func loadImage() {
        guard let selectedImage = selectedImage else { return }
        profileImage = Image(uiImage: selectedImage)
    }
    
}

private struct ProfilePhotoModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .scaledToFit()
            .frame(width: 180, height: 180)
            .clipShape(Circle())
    }
}

struct ProfilePhotoPickerView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePhotoPickerView()
    }
}


