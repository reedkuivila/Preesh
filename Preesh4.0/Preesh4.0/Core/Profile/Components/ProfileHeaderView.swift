//
//  ProfileHeaderView.swift
//  Preesh4.0
//
//  Created by reed kuivila on 3/28/24.
//

import SwiftUI

struct ProfileHeaderView: View {
    let user: User?
    
    init(user: User?) {
        self.user = user
    }
    
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 12) {
                // name and username
                VStack(alignment: .leading, spacing: 4) {
                    Text(user?.fullname ?? "")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    Text("@\(user?.username ?? "")")
                        .font(.subheadline)
                    
                }
                // user bio
                if let bio = user?.bio {
                    Text(bio)
                        .font(.footnote)
                } else {
                    Text("Add a bio here")
                        .font(.footnote)
                }
                
                Text("13 Friends")
                    .font(.caption)
                    .foregroundStyle(.gray)
            }
            
            Spacer()
            CircularProfileImageView()
        }
    }
}

#Preview {
    ProfileHeaderView(user: User(id: "",
                                 fullname: "mungus",
                                 email: "Jordan Mungus",
                                 username: "mungus",
                                 profileImageUrl: "mungus@mungo.edu"))
}
