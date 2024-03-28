//
//  ExploreViewModel.swift
//  Preesh4.0
//
//  Created by reed kuivila on 3/28/24.
//

import Foundation

class ExploreViewModel: ObservableObject {
    @Published var users = [User]()
    
    init() {
        Task { try await fetchUsers() }
    }
    
    /// NB: main actor brings the publishing back to the main thread rather than a background thread
    @MainActor
    private func fetchUsers() async throws {
        self.users = try await UserService.fetchUsers()
    }
}
