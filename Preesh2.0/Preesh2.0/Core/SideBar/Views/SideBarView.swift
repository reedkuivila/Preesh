//
//  SideBarView.swift
//  Preesh2.0
//
//  Created by reed kuivila on 7/24/23.
//

// king fisher used to pull the image from the internet using a url
// the url comes from the user class/object

import SwiftUI
import Kingfisher

struct SideBarView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    
    var body: some View {
        
        if let user = authViewModel.currentUser {
            VStack(alignment: .leading, spacing: 32) {
                VStack(alignment: .leading) {
                    KFImage(URL(string: user.profileImageUrl))
                        .resizable()
                        .scaledToFill()
                        .clipShape(Circle())
                        .frame(width: 48, height: 48)
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text(user.fullname)
                            .font(.headline)
                        
                        Text("@\(user.username)")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    UserStatsView()
                        .padding(.vertical)
                }
                .padding(.leading)
                
                ForEach(SideBarViewModel.allCases, id: \.rawValue) { viewModel in
                    if viewModel == .profile {
                        NavigationLink {
                            ProfileView(user: user)
                                .navigationBarHidden(true)
                        } label: {
                            SideBarOptionRowView(viewModel: viewModel)
                        }
                    } else if viewModel == .logout {
                        Button {
                            authViewModel.logOut()
                            print("DEBUG: logOut button clicked")
                        } label: {
                            SideBarOptionRowView(viewModel: viewModel)
                        }
                        
                    } else {
                        SideBarOptionRowView(viewModel: viewModel)
                    }

                }
                Spacer()
            }
        }
    }
}

struct SideBarView_Previews: PreviewProvider {
    static var previews: some View {
        SideBarView()
    }
}
