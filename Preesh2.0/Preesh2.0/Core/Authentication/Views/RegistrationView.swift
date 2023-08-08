//
//  RegistrationView.swift
//  Preesh2.0
//
//  Created by reed kuivila on 7/27/23.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email = ""
    @State private var username = ""
    @State private var fullname = ""
    @State private var password = ""
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var viewModel: AuthViewModel
    
    @State private var showProfilePicker = false
    
    @State var showPassword: Bool = false

    
    
    var body: some View {

        NavigationStack {
            VStack {
                AuthHeaderView(title1: "Join preesh today", title2: "create account below.", fontSize: 38)
                
                VStack(spacing: 40) {
                    // name
                    CustomInputField(imageName: "person",
                                     placeholderText: "Full name",
                                     text: $fullname)
                    .textInputAutocapitalization(.words)
                    
                    // username
                    CustomInputField(imageName: "person",
                                     placeholderText: "Username",
                                     text: $username)
                    .autocapitalization(.none)
                    
                    // email
                    CustomInputField(imageName: "envelope",
                                     placeholderText: "Email",
                                     text: $email)
                    .autocapitalization(.none)
                    .keyboardType(.emailAddress)
                    
                    // password
                    CustomInputField(imageName: "lock",
                                     placeholderText: "Password",
                                     isSecureField: true,
                                     text: $password)
                }
                .padding(32)
                
                Button {
                    viewModel.register(withEmail: email, password: password, fullname: fullname, username: username)
                    showProfilePicker = true
                    print("DEBUG: Sign up/register button clicked")
                    
                } label: {
                    Text("Sign Up")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 340, height: 50)
                        .background(Color("preeshBlue"))
                        .clipShape(Capsule())
                        .padding()
                }
                .shadow(radius: 20)
                
                Spacer()
                
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    HStack {
                        Text("Already a member?")
                            .font(.footnote)
                        
                        Text("Sign in here.")
                            .font(.footnote)
                            .fontWeight(.semibold)
                    }
                }
                .padding(.bottom, 32)
            }
            .navigationDestination(isPresented: $showProfilePicker) {
               ProfilePhotoPickerView()
                    .navigationBarBackButtonHidden(true)
           }

            .ignoresSafeArea()
        }
    }    
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
