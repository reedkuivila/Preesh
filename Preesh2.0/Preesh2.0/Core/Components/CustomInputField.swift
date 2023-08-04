//
//  LoginTextField.swift
//  Preesh2.0
//
//  Created by reed kuivila on 7/27/23.
//

import SwiftUI

struct CustomInputField: View {
    let imageName: String
    let placeholderText: String
    var isSecureField: Bool? = false
    @Binding var text: String
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.gray)
                
                if isSecureField ?? false {
                    SecureField(placeholderText, text: $text)

                } else {
                    TextField(placeholderText, text: $text)
                        .disableAutocorrection(true)

                }
            }
            
            Divider()
                .background(Color(.darkGray))
        }
    }
}

struct CustomInputField_Previews: PreviewProvider {
    static var previews: some View {
        CustomInputField(imageName: "person",
                         placeholderText: "Username",
                         isSecureField: false,
                         text: .constant(""))
    }
}
