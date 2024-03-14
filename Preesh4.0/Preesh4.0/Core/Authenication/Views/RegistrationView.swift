//
//  RegistrationView.swift
//  Preesh4.0
//
//  Created by reed kuivila on 3/11/24.
//

import SwiftUI

struct RegistrationView: View {
    @StateObject var viewModel = RegistrationViewModel()
    @State private var showAlert = false
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            AuthHeaderView(title1: "Join preesh today", title2: "create account below.", fontSize: 38)
            
            VStack(spacing: 40) {
                // name
                CustomInputField(imageName: "person",
                                 placeholderText: "Full name",
                                 text: $viewModel.fullname)
                .textInputAutocapitalization(.words)
                
                // username
                CustomInputField(imageName: "person",
                                 placeholderText: "Username",
                                 text: $viewModel.username)
                .autocapitalization(.none)
                
                // email
                CustomInputField(imageName: "envelope",
                                 placeholderText: "Email",
                                 text: $viewModel.email)
                .autocapitalization(.none)
                .keyboardType(.emailAddress)
                
                // password
                CustomInputField(imageName: "lock",
                                 placeholderText: "Password",
                                 isSecureField: true,
                                 text: $viewModel.password)
            }
            .padding(32)
            
            
            Button {
                // TODO: add firebase registration logic
                /// dev notes: anytime there is an async function and you call it, need to wrap it in a task & use try await
                Task { try await viewModel.createUser() }
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
