//
//  AuthViewModel.swift
//  Preesh2.0
//
//  Created by reed kuivila on 8/3/23.
//

import SwiftUI
import FirebaseAuth
import Firebase

class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var didAuthenticateUser = false
    
    init() {
        self.userSession = Auth.auth().currentUser
        
        print("DEBUG: User session is \(self.userSession?.uid)")
    }
    
    func login(withEmail email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: Failed to sign in with error \(error.localizedDescription)")
                return
            }
            guard let user = result?.user else { return }
            self.userSession = user
            
            print("DEBUG: Did login with \(email)")
        }
    }
    
    func register(withEmail email: String, password: String, fullname: String, username: String) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: Failed to register with error \(error.localizedDescription)")
                return
                // if something goes wrong, the return statement ends the function
            }
            
            guard let user = result?.user else { return }
//            self.userSession = user
            
            print("DEBUG: Registered user successfully")
            print("DEBUG: User is \(self.userSession)")
            
            // make dictionary for the user's info
            // TODO: add additional parameters - ? phone number, birthday ?
            let data = ["email": email,
                        "username": username.lowercased(),
                        "fullname": fullname,
                        "uid": user.uid]
            
            Firestore.firestore().collection("users")
                .document(user.uid)
                .setData(data) { _ in
                    // Activate the NavigationLink
                    self.didAuthenticateUser = true
                    print("DEBUG: Did upload user data ..")
                }
        }
    }
    
    func logOut() {
        // set userSession to nil --> shows login view
        self.userSession = nil
        
        // signs out user on backend server
        // signOut is a firebase function
        try? Auth.auth().signOut()
    }
    
    func uploadProfileImage(_ image: UIImage) {
        
    }
}
