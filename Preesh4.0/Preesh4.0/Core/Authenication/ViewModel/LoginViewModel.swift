//
//  LoginViewModel.swift
//  Preesh4.0
//
//  Created by reed kuivila on 3/13/24.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    
    @MainActor
    func login() async throws {
        try await AuthService.shared.login(
            withEmail: email,
            password: password)
        print("DEBUG: login new user here")
    }
}
