//
//  AuthViewModel.swift
//  Preesh2.0
//
//  Created by reed kuivila on 8/3/23.
//



import SwiftUI
import Firebase

class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    
    init() {
        self.userSession = Auth.auth().currentUser
        
        print("DEBUG: User session is \(self.userSession)")
    }
}
