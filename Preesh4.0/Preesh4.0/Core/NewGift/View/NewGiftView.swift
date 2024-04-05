//
//  NewGiftView.swift
//  Preesh4.0
//
//  Created by reed kuivila on 3/11/24.
//

import SwiftUI

struct NewGiftView: View {
    @StateObject var viewModel = NewGiftViewModel()
    @State private var giftName = ""
    
    let user: User
    
//    MARK: these should all be imported form NewGiftViewModel
        // once testing is complete will delete
    
//    @State private var giftName = ""
    @State private var giftLink = ""
    @State private var giftCost = ""
    @State private var giftSpecs = ""
    @State private var giftNotes = ""
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    CircularProfileImageView(user: nil, size: .small)
                    Text("Hi Jordan")
                        .fontWeight(.semibold)
                }
                    VStack(spacing: 40) {
                        CustomInputField(imageName: "gift.circle", placeholderText: "Gift name", text: $giftName)
                        
                        CustomInputField(imageName: "link.circle", placeholderText: "Product URL", text: $giftLink)
                        
                        CustomInputField(imageName: "tag.circle", placeholderText: "Cost", text: $giftCost)
                        
                        CustomInputField(imageName: "text.bubble.fill", placeholderText: "Specifications: size, color, etc.", text: $giftSpecs)
                        
                        CustomInputField(imageName: "pencil.circle", placeholderText: "Anything else?", text: $giftNotes)
                    }
                    .font(.footnote)
                    .padding(.horizontal)
                    .padding(.vertical)
            }
            .navigationTitle("New Gift")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        task { try await viewModel.uploadGift(giftName: giftName) }
                    } label: {
                        Text("Add Gift")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .padding(.horizontal)
                            .padding(.vertical, 8)
                            .foregroundColor(.white)
                            .background(viewModel.giftName.isEmpty ? Color("preeshBlue").opacity(0.5) : Color("preeshBlue"))
                            .clipShape(Capsule())
                    }
                }
            }
        }
    }
}

#Preview {
    NewGiftView(user: User(id: "",
                           fullname: "mungus",
                           email: "Jordan Mungus",
                           username: "@mungus",
                           profileImageUrl: "mungus@mungo.edu"))
}
