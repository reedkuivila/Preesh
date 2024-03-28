//
//  CurrentUserProfileView.swift
//  Preesh4.0
//
//  Created by reed kuivila on 3/28/24.
//

import SwiftUI

struct CurrentUserProfileView: View {
    @StateObject var viewModel = CurrentUserProfileViewModel()
    // DEBUG this is new for the sheet isPresented for settings
    @State private var showSettings = false
    
    private var currentUser: User? {
        return viewModel.currentUser
    }
    
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                // bio and stats
                VStack(spacing: 20) {
                    ProfileHeaderView(user: currentUser)
                    
                    
                    HStack {
                        // follow button
                        Button {
                            // TODO: add action here
                        } label: {
                            Text("Edit Profile")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                                .frame(width: 176, height: 32)
                                .background(Color("preeshBlue"))
                                .cornerRadius(8)
                        }
                        
                        // share profile button
                        Button {
                            // TODO: add action here
                        } label: {
                            Text("Share Profile")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                                .frame(width: 176, height: 32)
                                .background(Color("preeshBlue"))
                                .cornerRadius(8)
                        }
                    }
                    UserContentListView()
                }
                // NB: without this the CircularProfileImageView() is slighltly cutoff
                .padding(.horizontal, 1)
                .padding(.vertical, 1)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showSettings.toggle()
                        //                        AuthService.shared.signOut()
                    } label : {
                        Image(systemName: "gearshape")
                    }
                }
            }
            .padding()
        }
        // DEBUG this is new, the gear alone used to log out the user
        .sheet(isPresented: $showSettings, content: {
            SettingsView()
        })
        
    }
}

#Preview {
    CurrentUserProfileView()
}
