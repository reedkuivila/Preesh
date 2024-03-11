//
//  RegistrationView.swift
//  Preesh4.0
//
//  Created by reed kuivila on 3/11/24.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email = ""
    @State private var username = ""
    @State private var fullname = ""
    @State private var password = ""
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
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
                // TODO: add firebase registration logic
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
               // TODO: add action
                dismiss()
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
        .ignoresSafeArea()
    }
}

#Preview {
    RegistrationView()
}
