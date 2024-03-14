//
//  AuthService.swift
//  Preesh4.0
//
//  Created by reed kuivila on 3/13/24.
//

import Foundation
import Firebase

class AuthService {
    
    @Published var userSession: FirebaseAuth.User?
    
    static let shared = AuthService()
    
    /// code from firebase API
    init() {
        self.userSession = Auth.auth().currentUser
    }
    
    @MainActor
    func login(withEmail email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            print("DEBUG: created used \(result.user.uid)")
        } catch {
            print("DEBUG: failed to create user with error \(error.localizedDescription)")
        }
    }
    
    @MainActor
    func createUser(withEmail email: String, password: String, fullname: String, username: String) async throws {
        /// dev notes: anytime you throw an error, wrap in a do-catch block. Anytime there is an error it will be caught in the "catch" block to give back the error
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            print("DEBUG: created used \(result.user.uid)")
        } catch {
            print("DEBUG: failed to create user with error \(error.localizedDescription)")
        }
        
    }
    
    func signOut() {
        // signout on backned in firebase
        try? Auth.auth().signOut()
        // this ends the session locally and updates routing
        self.userSession = nil
    }
}
