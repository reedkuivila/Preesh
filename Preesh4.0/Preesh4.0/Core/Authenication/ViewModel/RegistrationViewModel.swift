//
//  RegistrationViewModel.swift
//  Preesh4.0
//
//  Created by reed kuivila on 3/13/24.
//

import Foundation

class RegistrationViewModel: ObservableObject {
    @Published var email = ""
    @Published var username = ""
    @Published var fullname = ""
    @Published var password = ""
    
    @MainActor
    func createUser() async throws {
        try await AuthService.shared.createUser(
            withEmail: email,
            password: password,
            fullname: fullname,
            username: username)
        print("DEBUG: Create new user here")
    }
}
