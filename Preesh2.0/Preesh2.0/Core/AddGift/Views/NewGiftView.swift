//
//  NewGiftView.swift
//  Preesh2.0
//
//  Created by reed kuivila on 7/27/23.
//

import SwiftUI
import Kingfisher

struct NewGiftView: View {
    @State private var giftName = ""
    @State private var giftURL = ""
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var authViewModel: AuthViewModel
    @ObservedObject var viewModel = AddGiftViewModel()
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Cancel")
                        .foregroundColor(Color("preeshBlue"))
                }
                
                Spacer()
                
                Button {
                    viewModel.addGift(withCaption: giftName)
                    print("\(giftName) added to list")
                } label: {
                    Text("Add Gift")
                        .bold()
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                        .background(Color("preeshBlue"))
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                }
            }
            .padding()
            
            HStack(alignment: .top) {
                if let user = authViewModel.currentUser {
                    KFImage(URL(string: user.profileImageUrl))
                        .resizable()
                        .scaledToFill()
                        .clipShape(Circle())
                        .frame(width: 64, height: 64)
                }
                
                TextField("What is the name of the gift?", text: $giftName)
            }
            .padding()
            
            TextField("Paste a link here", text: $giftURL) // Add a TextField for the URL input
                        .textFieldStyle(RoundedBorderTextFieldStyle()) // You can style it as needed
                        .padding()
        }
        .onReceive(viewModel.$didAddGift) { success in
            if success {
                presentationMode.wrappedValue.dismiss()
            }
        }
    }
}

struct NewItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewGiftView()
            .environmentObject(AuthViewModel())
    }
}
