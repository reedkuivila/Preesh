//
//  EditProfileView.swift
//  Preesh4.0
//
//  Created by reed kuivila on 3/12/24.
//

import SwiftUI
import PhotosUI

struct EditProfileView: View {
    let user: User
    
    @State private var bio = ""
    @State private var birthday = ""
    @State private var address = ""
    @State private var isPrivate = false
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel = EditProfileViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.systemGroupedBackground)
                    .edgesIgnoringSafeArea([.bottom, .horizontal])
                
                VStack {
                    // name and image
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Name")
                                .fontWeight(.semibold)
                            
                            Text(user.fullname)
                        }
                        Spacer()
                        
                        PhotosPicker(selection: $viewModel.selectedItem) {
                            if let image = viewModel.profileImage {
                                image
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 40, height: 40)
                                    .clipShape(Circle())
                            } else {
                                CircularProfileImageView(user: user, size: .small)
                            }
                        }
                        
                        
                    }
                    Divider()
                    
                    // bio field
                    VStack(alignment: .leading) {
                        Text("Bio")
                            .fontWeight(.semibold)
                        
                        TextField("Enter your bio here", text: $bio, axis: .vertical)
                    }
                    Divider()
                    
                    // user birthday
                    VStack(alignment: .leading) {
                        Text("Birthday")
                            .fontWeight(.semibold)
                        
                        TextField("Enter your birthday here", text: $birthday)
                    }
                    Divider()
                    
                    // user address
                    VStack(alignment: .leading) {
                        Text("Address")
                            .fontWeight(.semibold)
                        
                        TextField("Enter your address here", text: $address)
                    }
                    Divider()
                    
                    // MARK: add more field as necessary
                    
                    // private profile toggle
                    Toggle("Private profile", isOn: $isPrivate)
                    
                }
                .font(.footnote)
                .padding()
                .background(.white)
                .cornerRadius(8)
                .overlay {
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color("preeshBlue").opacity(0.5), lineWidth: 1)
//                        .stroke(Color(.systemGray4), lineWidth: 1)

                }
                .padding()
                
            }
            .navigationTitle("Edit Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                    .font(.subheadline)
                    .foregroundColor(.black)
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        Task { try await viewModel.updateUserData()
                            dismiss()
                        }
                    }
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                }
            }
        }
    }
}

#Preview {
    EditProfileView(user: User(id: "",
                               fullname: "mungus",
                               email: "Jordan Mungus",
                               username: "@mungus",
                               profileImageUrl: "mungus@mungo.edu"))
}
