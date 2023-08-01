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
    
    var body: some View {
        // parent container VStack
        VStack {
            
            // header view
            VStack(alignment: .leading) {
                HStack { Spacer() }
                Text("Welcome to Preesh.")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                
                Text("Join below.")
                    .font(.title)
                    .fontWeight(.semibold)
            }
            .frame(height: 260)
            .padding(.leading)
            .background(Color("preeshBlue"))
            .foregroundColor(.white)
            .clipShape(RoundedShape(corners: [.bottomRight]))
            
            VStack(spacing: 40) {
                TextField("username", text: $username)
                
                TextField("password", text: $password)
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
                print("sign in here")
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
