//
//  PreviewDataProvider.swift
//  Preesh4.0
//
//  Created by reed kuivila on 3/28/24.
//

import SwiftUI

extension PreviewProvider {
    static var dev: MontourProfilePreview {
        return MontourProfilePreview.shared
    }
}

class MontourProfilePreview {
    static let shared = MontourProfilePreview()
    
    let user = User(id: "",
                    fullname: "mungus",
                    email: "Jordan Mungus",
                    username: "@mungus",
                    profileImageUrl: "mungus@mungo.edu")
}
