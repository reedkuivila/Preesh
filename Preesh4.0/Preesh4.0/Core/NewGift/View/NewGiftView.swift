//
//  NewGiftView.swift
//  Preesh4.0
//
//  Created by reed kuivila on 3/11/24.
//

import SwiftUI

struct NewGiftView: View {
    @State private var giftName = ""
    @State private var giftURL = ""
    @State private var giftCost = ""
    @State private var giftSpecs = ""
    @State private var giftNotes = ""
    @State private var giftDetails = ""
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    CircularProfileImageView()
                    Text("Hi Jordan")
                        .fontWeight(.semibold)
                }
                    VStack(spacing: 40) {
                        CustomInputField(imageName: "gift.circle", placeholderText: "Gift name", text: $giftName)
                        
                        CustomInputField(imageName: "link.circle", placeholderText: "Product URL", text: $giftURL)
                        
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
                    Button {
                        dismiss()
                    } label: {
                        Text("Cancel")
                            .font(.subheadline)
                        //                            .fontWeight(.semibold)
                            .foregroundColor(Color("preeshBlue"))
                    }
                    
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        // TODO: add logic to add this to user database
                    } label: {
                        Text("Add Gift")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .padding(.horizontal)
                            .padding(.vertical, 8)
                            .foregroundColor(.white)
                            .background(giftName.isEmpty ? Color("preeshBlue").opacity(0.5) : Color("preeshBlue"))
                            .clipShape(Capsule())
                    }
                }
            }
        }
    }
}

#Preview {
    NewGiftView()
}
