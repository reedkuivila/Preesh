//
//  ProfileView.swift
//  Preesh4.0
//
//  Created by reed kuivila on 3/11/24.
//

import SwiftUI
import Firebase

/// Profile view for profiles that are not the current user. differences outlines below
    ///  only shares the profile owners wishlist, not bookmarks
    ///  features an "add friend" button and no settings option
struct ProfileView: View {
    let user: User
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            // bio and stats
            VStack(spacing: 20) {
                ProfileHeaderView(user: user)
                
                // follow button
                Button {
                    // TODO: add action here
                } label: {
                    Text("Add Friend")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width: 352, height: 32)
                        .background(Color("preeshBlue"))
                        .cornerRadius(8)
                }
                
                // user content filter view (view ProfileView extension
                contentFilterView
                
            }
            // NB: without this the CircularProfileImageView() is slighltly cutoff
            .padding(.horizontal, 1)
            .padding(.vertical, 1)
        }
        .navigationBarTitleDisplayMode(.inline)
        .padding()
    }
}

#Preview {
    ProfileView(user: User(
        id: "",
        fullname: "mungus",
        email: "Jordan Mungus",
        username: "mungus",
        profileImageUrl: "mungus@mungo.edu"))
}



extension ProfileView {
    private var contentFilterView: some View {
        VStack {
            HStack {
                VStack {
                    Text(ProfileFilter.wishList.title) // Directly use the `.wishList` case
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    
                    Capsule()
                        .foregroundColor(Color("preeshBlue"))
                        .frame(height: 3)
                }
            }
            
            LazyVStack {
                ForEach(0...19, id: \.self) { gift in
//                    GiftCell(gift: gift)
                }
            }
        }
    }
}


