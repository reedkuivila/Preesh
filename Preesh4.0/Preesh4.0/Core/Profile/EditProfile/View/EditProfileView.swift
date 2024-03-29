//
//  EditProfileView.swift
//  Preesh4.0
//
//  Created by reed kuivila on 3/12/24.
//

import SwiftUI

struct EditProfileView: View {
    @State private var bio = ""
    @State private var birthday = ""
    @State private var address = ""
    @State private var isPrivate = false
    
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
                            
                            Text("Jordan Montour")
                        }
                        Spacer()
                        
                        CircularProfileImageView()
                        
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
                        // TODO: add action
                    }
                    .font(.subheadline)
                    .foregroundColor(.black)
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        // TODO: add action
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
    EditProfileView()
}
