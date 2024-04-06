//
//  PreviewDataProvider.swift
//  Preesh4.0
//
//  Created by reed kuivila on 3/28/24.
//

import SwiftUI
import Firebase

extension PreviewProvider {
    static var dev: DeveloperPreview{
        return DeveloperPreview.shared
    }
}

class DeveloperPreview {
    static let shared = DeveloperPreview()
    
    let user = User(id: "",
                    fullname: "mungus",
                    email: "Jordan Mungus",
                    username: "@mungus",
                    profileImageUrl: "mungus@mungo.edu")
    
    let gift = Gift(ownerUid: "123", 
                    giftName: "test gift",
                    timestamp: Timestamp(),
                    likes: 0)
}
