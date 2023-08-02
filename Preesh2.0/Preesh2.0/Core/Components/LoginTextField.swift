//
//  LoginTextField.swift
//  Preesh2.0
//
//  Created by reed kuivila on 7/27/23.
//

import SwiftUI

struct LoginTextField: View {
    let imageName: String
    let placeholderText: String
    @Binding var text: String
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct LoginTextField_Previews: PreviewProvider {
    static var previews: some View {
        LoginTextField(imageName: "person",
                       placeholderText: "Username or email",
                       text: .constant(""))
    }
}
