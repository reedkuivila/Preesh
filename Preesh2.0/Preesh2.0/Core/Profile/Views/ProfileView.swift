//
//  ProfileView.swift
//  Preesh2.0
//
//  Created by reed kuivila on 7/20/23.
//

import SwiftUI
import Kingfisher

struct ProfileView: View {
    @State private var selectedFilter: ItemFilterViewModel = .wishList
    @Namespace var animation
    @Environment(\.presentationMode) var mode
    @EnvironmentObject var authViewModel: AuthViewModel
    
    private let user: User
    
    init(user: User) {
        self.user = user
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            headerView
            actionButtons
            userInfo
            filterView
            itemScrollView
            
            Spacer()
        }
        .navigationBarHidden(true)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(user: User(id: NSUUID().uuidString,
                               username: "mungus",
                               fullname: "Jordan Mungus",
                               profileImageUrl: "",
                               email: "mungus@mungo.edu"))
        .environmentObject(AuthViewModel())
    }
}


extension ProfileView {
    
    // variable to hold all elements in the header
    var headerView: some View {
        ZStack(alignment: .bottomLeading) {
            Color("preeshBlue")
                .ignoresSafeArea()
            
            Image("preeshVertical")
                .resizable()
                .cornerRadius(40)
                .shadow(radius: 20)
                .frame(width: 150, height: 100)
                .offset(x: 125, y: -10)
            
            VStack {
                Button {
                    mode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "arrow.left")
                        .resizable()
                        .frame(width: 20, height: 16)
                        .foregroundColor(.white)
                        .offset(x: 16, y: 12)
                }
                
                ZStack {
                    // place holder for development purposes
                    Circle()
                        .scaledToFill()
                        .clipShape(Circle())
                        .frame(width: 72, height: 72)
                        .offset(x:16, y: 24)
                    
                    // add user's real profile image
                    KFImage(URL(string: user.profileImageUrl))
                        .resizable()
                        .scaledToFill()
                        .clipShape(Circle())
                        .frame(width: 72, height: 72)
                        .offset(x:16, y: 24)
                  
                }
                
                
            }
            
        }
        .frame(height: 110)
    }
    
    // variable to hold the action buttons to edit profile
    var actionButtons: some View {
        HStack(spacing: 12) {
            Spacer()
            
            Image(systemName: "bell.badge")
                .font(.title3)
                .padding(6)
                .overlay(Circle().stroke(Color.gray, lineWidth: 0.75))
            
            Button {
                
            } label: {
                Text("Edit Info")
                    .font(.subheadline).bold()
                    .frame(width: 120, height: 32)
                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.gray, lineWidth: 0.75))
            }
        }
        .padding(.trailing)
    }
    
    // variable to hold all of the users personal/bio info
    var userInfo: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack {
                Text(user.fullname)
                    .font(.title2).bold()
            }
            
            Text("@\(user.username)")
                .font(.subheadline)
                .foregroundColor(.gray)
            
            Text("Big fan of smartwool socks. Curious about cast iron")
                .font(.subheadline)
                .padding(.vertical)
            
            HStack(spacing: 24) {
                HStack {
                    Image(systemName: "birthday.cake")
                    Text("November 1, 1993")
                }
                
                HStack {
                    Image(systemName: "envelope")
                    Text("10 Main St, New Haven CT 06501")
                }
            }
            .font(.caption)
            .foregroundColor(.gray)
            
            HStack(spacing: 4) {
                HStack {
                    Text("32")
                        .font(.subheadline)
                        .bold()
                    
                    Text("friends")
                        .font(.caption)
                }
            }
            .padding(.vertical)
        }
        .padding(.horizontal)
    }
    
    // variable to hold the filter bar
    var filterView: some View {
        HStack {
            ForEach(ItemFilterViewModel.allCases, id: \.rawValue) { option in
                VStack {
                    Text(option.title)
                        .font(.subheadline)
                        .fontWeight(selectedFilter == option ? .semibold : .regular)
                        .foregroundColor(selectedFilter == option ? .black : .gray)
                    
                    if selectedFilter == option {
                        Capsule()
                            .foregroundColor(Color("preeshBlue"))
                            .frame(height: 3)
                            .matchedGeometryEffect(id: "filter", in: animation)
                        
                    } else {
                        Capsule()
                            .foregroundColor(Color(.clear))
                            .frame(height: 3)
                        
                    }
                }
                .onTapGesture {
                    withAnimation(.easeInOut) {
                        self.selectedFilter = option
                    }
                }
            }
        }
        .overlay(Divider().offset(x: 0, y: 16))
    }
    
    // variable for the scroll view
    var itemScrollView: some View {
        ScrollView {
            LazyVStack {
                ForEach(0...9, id: \.self) { _ in
                    ItemRowView()
                        .padding()
                }
            }
        }
    }
    
}
