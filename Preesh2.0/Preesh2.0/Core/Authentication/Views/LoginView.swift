//
//  LoginView.swift
//  Preesh2.0
//
//  Created by reed kuivila on 7/27/23.
//

import SwiftUI

struct LoginView: View {
    @State private var username = ""
    @State private var password = ""
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        // parent container VStack
        VStack {
            
            // header view
            AuthHeaderView(title1: "Welcome to preesh", title2: "get started below.", fontSize: 40)

            
            VStack(spacing: 40) {
                CustomInputField(imageName: "person",
                                 placeholderText: "Email",
                                 text: $username)
                .autocapitalization(.none)
                .keyboardType(.emailAddress)
                
                CustomInputField(imageName: "lock",
                                 placeholderText: "Password",
                                 isSecureField: true,
                                 text: $password)
            }
            .padding(.horizontal, 32)
            .padding(.top, 44)
            
            HStack {
                Spacer()
                
                NavigationLink {
                    Text("reset password view will go here")
                } label: {
                    Text("Forgot password?")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(Color("preeshBlue"))
                        .padding(.top)
                        .padding(.trailing, 24)
                }
            }
            
            Button {
                viewModel.login(withEmail: username, password: password)
                print("DEBUG: sign in clicked")
                
            } label: {
                Text("Sign In")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: 340, height: 50)
                    .background(Color("preeshBlue"))
                    .clipShape(Capsule())
                    .padding()
            }
            .shadow(radius: 20)
            
            Spacer()
        
            NavigationLink {
                RegistrationView()
                    .navigationBarHidden(true)
            } label: {
                HStack {
                    Text("Not a member?")
                        .font(.footnote)
                    
                    Text("Join here.")
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
            }
            .padding(.bottom, 32)
            .foregroundColor(Color("preeshBlue"))
        }
        .ignoresSafeArea()
        .navigationBarHidden(true)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
