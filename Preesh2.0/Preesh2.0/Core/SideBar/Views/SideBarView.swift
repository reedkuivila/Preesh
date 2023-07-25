//
//  SideBarView.swift
//  Preesh2.0
//
//  Created by reed kuivila on 7/24/23.
//

import SwiftUI

struct SideBarView: View {
    var body: some View {
        
        VStack(alignment: .leading, spacing: 32) {
            VStack(alignment: .leading) {
                Circle()
                    .frame(width: 48, height: 48)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("Jordan Montour")
                        .font(.headline)
                    
                    Text("@montour")
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
                        ProfileView()
                            .navigationBarHidden(true)
                    } label: {
                        SideBarOptionRowView(viewModel: viewModel)
                    }
                } else if viewModel == .logout {
                    Button {
                        print("log out success")
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

struct SideBarView_Previews: PreviewProvider {
    static var previews: some View {
        SideBarView()
    }
}
