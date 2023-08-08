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
    private var tempUserSession: FirebaseAuth.User?
    
    private let service = UserService()
    
    init() {
        self.userSession = Auth.auth().currentUser
        self.fetchUser()
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
            self.tempUserSession = user
            
            // make dictionary for the user's info
            // TODO: add additional parameters - ? phone number, birthday ?
            let data = ["email": email,
                        "username": username.lowercased(),
                        "fullname": fullname,
                        "uid": user.uid]
            
            // makes a collection on firebase database - NB can also do this manually on website
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
    
    // goes into database and updates users structure
    // then calls back to get the path to the user image
    func uploadProfileImage(_ image: UIImage) {
        guard let uid = tempUserSession?.uid else { return }
        
        ImageUploader.uploadImage(image: image) { profileImageUrl in
            Firestore.firestore().collection("users")
                .document(uid)
                .updateData(["profileImageUrl": profileImageUrl]) { _ in
                    self.userSession = self.tempUserSession
                }
        }
    }
    
    func fetchUser() {
        guard let uid = self.userSession?.uid else { return }
        
        service.fetchUser(withUid: uid)
    }
}
