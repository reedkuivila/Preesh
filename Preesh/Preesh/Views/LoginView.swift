//
//  LoginView.swift
//  Preesh
//
//  Created by reed kuivila on 5/23/23.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        NavigationView {
        VStack {
            //header here
            AuthHeaderView(title1: "Welcome back")
            
            VStack(spacing: 40) {
                CustomInputField(imageName: "envelope",
                                 placeholderText: "Email",
                                 textCase: .lowercase,
                                 keyboardType: .emailAddress,
                                 textContentType: .emailAddress,
                                 text: $email)
                
                
                CustomInputField(imageName: "lock",
                                 placeholderText: "Password",
                                 textCase: .lowercase,
                                 keyboardType: .default,
                                 textContentType: .password,
                                 isSecureField: true,
                                 text: $password)
            }
            .padding(.horizontal, 32)
            .padding(.top, 44)
            
            HStack {
                Spacer()
                
                NavigationLink {
                    Text("have user rest their password")
                } label: {
                    Text("Forgot Password?")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(CustomColor.preeshBlue)
                        .padding(.top)
                        .padding(.trailing, 24)
                }
            }
            
            NavigationLink(destination: ProfileView()){                
                Button {
                    print("Sign In")
//                viewModel.login(withEmail: email, password: password)
                } label: {
                    Text("Sign In")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 340, height: 50)
                        .background(CustomColor.preeshBlue)
                        .clipShape(Capsule())
                        .padding()
                }
            }
            .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 0)
            
            Spacer()
            
            // MARK: Need to add a page to register a new user
            NavigationLink  {
                EmptyView()
                    .navigationBarHidden(true)
            } label: {
                HStack {
                    Text("Don't have an account?")
                        .font(.footnote)
                    
                    Text("Sign Up")
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
            }
            .padding(.bottom, 32)
            .foregroundColor(CustomColor.preeshBlue)
            
        }
        .ignoresSafeArea()
        
    }
    }
}

struct AuthHeaderView: View {
    let title1: String
    
    var body: some View {
        VStack(alignment: .center) {
            HStack { Spacer()}
            
            Image("preeshHorizontal")
                .resizable()
                .clipShape(Rectangle())
                .cornerRadius(60)
                .shadow(radius: 20)
                .padding(.top, 60)
                .padding(.trailing)
            
            Text(title1)
                .font(.custom("times", size: 30)).bold()
                .font(.largeTitle)
                .fontWeight(.semibold)
        }
        .frame(height: 270)
        .padding(.leading)
        .background(CustomColor.preeshBlue)
        .foregroundColor(.white)
        .clipShape(Rectangle())
    }
}


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
