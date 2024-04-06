//
//  SideBarView.swift
//  Preesh4.0
//
//  Created by reed kuivila on 3/13/24.
//

import SwiftUI

struct SideBarView: View {
    @EnvironmentObject var authViewModel: RegistrationViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading, spacing: 4) {
                CircularProfileImageView(user: nil, size: .small)

                Text("Jordan Montour")
                    .font(.headline)
                
                Text("@mungaloid")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            UserStatsView()
                .padding(.vertical)
            
            ForEach(SideBarViewModel.allCases, id: \.rawValue) { viewModel in
                if viewModel == .profile {
                    NavigationLink {
                        CurrentUserProfileView()
                            .navigationBarHidden(true)
                    } label: {
                        SideBarOptionRowView(viewModel: viewModel)
                    }
                } else if viewModel == .logout {
                    Button {
                        //                    authViewModel.logOut()
                        print("DEBUG: log Out button clicked")
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


#Preview {
    SideBarView()
}
