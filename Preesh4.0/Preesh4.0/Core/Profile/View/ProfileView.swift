//
//  ProfileView.swift
//  Preesh4.0
//
//  Created by reed kuivila on 3/11/24.
//

import SwiftUI

struct ProfileView: View {
    @State private var selectedFilter: ProfileFilter = .wishList
    @Namespace var animation
        
    var body: some View {
        ScrollView(showsIndicators: false) {
            // bio and stats
            VStack(spacing: 20) {
                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: 12) {
                        // name and username
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Jordan Montour")
                                .font(.title2)
                                .fontWeight(.semibold)
                            
                            Text("@montour")
                                .font(.subheadline)
                            
                        }
                        // user bio
                        Text("Cast iron enthusiast. Krukon emeritus")
                            .font(.footnote)
                        
                        Text("13 Friends")
                            .font(.caption)
                            .foregroundStyle(.gray)
                    }
                    
                    Spacer()
                    CircularProfileImageView()
                }
                
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
                
                // user content filter view
                VStack {
                    HStack {
                        ForEach(ProfileFilter.allCases) {
                            filter in
                            VStack {
                                Text(filter.title)
                                    .font(.subheadline)
                                    .fontWeight(selectedFilter == filter ? .semibold :
                                            .regular)
                                
                                if selectedFilter == filter {
                                    Capsule()
                                        .foregroundColor(Color("preeshBlue"))
                                        .frame(height: 3)
                                        .matchedGeometryEffect(id: "item", in: animation)
                                    
                                } else {
                                    Capsule()
                                        .foregroundColor(Color(.clear))
                                        .frame(height: 3)
                                    
                                }
                            }
                            .onTapGesture {
                                withAnimation(.spring()) {
                                    self.selectedFilter = filter
                                }
                            }
                        }
                    }
                    
                    LazyVStack {
                        ForEach(0...19, id: \.self) { gift in
                            GiftCell()
                        }
                    }
                }
                .padding(.vertical, 8)
            }
            // NB: without this the CircularProfileImageView() is slighltly cutoff
            .padding(.horizontal, 1)
            .padding(.vertical, 1)
        }
        .padding()
    }
}

#Preview {
    ProfileView()
}
