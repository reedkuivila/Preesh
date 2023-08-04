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
    
    @State var showPassword: Bool = false

    var body: some View {
        VStack {
            HStack {
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.gray)
                
                // implement hidden/visible password option only for secure field
                if isSecureField ?? false {
                    // logic to switch from TextField to SecureField
                    if showPassword {
                        TextField(placeholderText, text: $text)
                    } else {
                        SecureField(placeholderText, text: $text)
                    }
                    
                    // button to toggle eye image when password is hidden
                    Button {
                        showPassword.toggle()
                    } label: {
                        Image(systemName: showPassword ? "eye" : "eye.slash")
                            .foregroundColor(.gray)
                    }

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
