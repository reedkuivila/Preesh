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
    @State private var giftCost = ""
    @State private var giftSpecs = ""
    @State private var giftNotes = ""
    @State private var giftDetails = ""
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var authViewModel: AuthViewModel
    @ObservedObject var viewModel = AddGiftViewModel()
    
    let user: User
    
    
    
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
                    viewModel.addGift(withCaption: giftName,
                                      giftUrl: giftURL,
                                      giftDetails: giftDetails,
                                      giftPrice: giftCost,
                                      giftSpecifications: giftSpecs,
                                      giftNotes: giftNotes)
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
            
            ScrollView {
                HStack(alignment: .top) {
                    if let user = authViewModel.currentUser {
                        KFImage(URL(string: user.profileImageUrl))
                            .resizable()
                            .scaledToFill()
                            .clipShape(Circle())
                            .frame(width: 64, height: 64)
                            .padding()
                    } else {
                        Circle()
                            .scaledToFill()
                            .clipShape(Circle())
                            .frame(width: 64, height: 64)
                    }
                    
                    Text("Hi \(self.user.fullname)")
                        .font(.headline)
                        .padding(.top)
                    
                    //                TextField("What is the name of the gift?", text: $giftName)
                }
                .padding(.trailing, 150)
                
                
                VStack(alignment: .leading) {
                    Text("Tell us the name")
                        .font(.body)
                    
                    Text("Everything else is optional.")
                        .font(.body)
                }
                .padding(.trailing, 150)
                
                
                VStack(spacing: 40) {
                    CustomInputField(imageName: "gift.circle", placeholderText: "Gift name", text: $giftName)
                    
                    CustomInputField(imageName: "link.circle", placeholderText: "Product URL", text: $giftURL)
                    
                    CustomInputField(imageName: "tag.circle", placeholderText: "Cost", text: $giftCost)
                    
                    CustomInputField(imageName: "text.bubble.fill", placeholderText: "Specifications: size, color, etc.", text: $giftSpecs)
                    
                    CustomInputField(imageName: "pencil.circle", placeholderText: "Anything else?", text: $giftNotes)
                }
                .padding(.horizontal, 32)
                .padding(.top, 44)
                
            }
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
        NewGiftView(user: User(id: NSUUID().uuidString,
                               username: "mungus",
                               fullname: "Jordan Mungus",
                               profileImageUrl: "",
                               email: "mungus@mungo.edu"))
        .environmentObject(AuthViewModel())
    }
}

