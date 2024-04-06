//
//  GiftCell.swift
//  Preesh4.0
//
//  Created by reed kuivila on 3/11/24.
//

import SwiftUI
import Firebase

struct GiftCell: View {
    let gift: Gift
    
    var body: some View {
        VStack {
            HStack(alignment: .top, spacing: 12) {
                CircularProfileImageView(user: gift.user, size: .small)
                
                VStack(alignment: .leading) {
                    HStack {
                        Text("@\(gift.user?.username ?? "")")
                            .font(.footnote)
                            .fontWeight(.semibold)
                        
                        Spacer()
                        
                        Text("Timestamp")
                            .foregroundColor(.gray)
                            .font(.caption)
                    }
                    
                    Text(gift.giftName)
                        .font(.subheadline)
                        .multilineTextAlignment(.leading)
                    
                    // user action buttons
                    HStack(spacing: 16) {
                        // comment action button
                        Button {
                            // TODO: add action
                        } label: {
                            Image(systemName: "bubble.left")
                        }
                        Spacer()
                
                        // like action button
                        Button {
                            // TODO: add action
                        } label: {
                            Image(systemName: "hand.thumbsup")
                        }
                        Spacer()
                        
                        // save action button
                        Button {
                            // TODO: add action
                        } label: {
                            Image(systemName: "bookmark")
                        }
                        Spacer()
                        
                        // send action button
                        Button {
                            // TODO: add action
                        } label: {
                            Image(systemName: "paperplane")
                        }
                        Spacer()
                    }
                    .foregroundColor(Color("preeshBlue"))
                    .padding(.vertical, 8)
                }
            }
            Divider()
        }
        .padding()
    }
}

#Preview {
    GiftCell(gift: Gift(ownerUid: "123",
                        giftName: "test gift",
                        timestamp: Timestamp(),
                        likes: 0))
}
