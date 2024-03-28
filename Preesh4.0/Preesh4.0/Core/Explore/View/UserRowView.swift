//
//  UserRowView.swift
//  Preesh4.0
//
//  Created by reed kuivila on 3/11/24.
//


import SwiftUI


struct UserRowView: View {
    let user: User
    
    var body: some View {
        VStack {
            HStack {
                CircularProfileImageView()
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(user.fullname)
                        .font(.subheadline)
                        .bold()
                        .foregroundColor(.black)
                    
                    Text("@\(user.username)")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                Spacer()
                
                Text("Add Friend")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .frame(width: 100, height: 32)
                    .overlay {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color("preeshBlue"))
                    }
            }
            .padding(.horizontal)
            .padding(.vertical, 4)
        }

    }
}


#Preview {
    UserRowView(user: User(id: NSUUID().uuidString,
                           fullname: "mungus",
                           email: "Jordan Mungus",
                           username: "@mungus",
                           profileImageUrl: "mungus@mungo.edu"))
    
}
