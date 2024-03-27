//
//  ProfileViewModel.swift
//  Preesh4.0
//
//  Created by reed kuivila on 3/27/24.
//

import Foundation
import Combine

class ProfileViewModel: ObservableObject {
    @Published var currentUser: User?
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        setupSubscribers()
    }
    
    private func setupSubscribers() {
        UserService.shared.$currentUser.sink { [weak self] user in
            self?.currentUser = user
            print("DEBUG: user in view model from comnbine is \(user)")
            
        }.store(in: &cancellables)
    }
}
