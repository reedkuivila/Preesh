//
//  ItemRowView.swift
//  Preesh2.0
//
//  Created by reed kuivila on 7/20/23.
//

// MARK: individual cell to show when a user adds an item to their list

import SwiftUI
import Kingfisher
import Firebase

struct GiftRowView: View {
    let gift: Gift
    
    var body: some View {
        VStack {
            
            // username, profile image, item
            if let user = gift.user {
                HStack(alignment: .top, spacing: 12) {
                    KFImage(URL(string: user.profileImageUrl))
                        .resizable()
                        .scaledToFill()
                        .frame(width: 56, height: 56)
                        .clipShape(Circle())
                    
                    // username/info & item added notification
                    VStack(alignment: .leading, spacing: 4) {
                        // user info & timestamp
                        HStack {
                            Text("@\(user.username)")
                                .font(.subheadline)
                                .bold()
                            
                            Text("\(timeAgoCalculator(gift.timestamp.dateValue()))")
                                .foregroundColor(.gray)
                                .font(.caption)
                        }
                        
                        // display the item/gift added to users wish list
                        Text("\(user.fullname) added \(gift.caption) to their wish list")
                            .font(.subheadline)
                            .multilineTextAlignment(.leading)
                    }
                }
            }
            
            // user action buttons
            // folded
            HStack {
                // comment action button
                Button {
                    // TODO: add action
                } label: {
                    Image(systemName: "bubble.left")
                        .font(.subheadline)
                }
                Spacer()
                
                // like action button
                Button {
                    // TODO: add action
                } label: {
                    Image(systemName: "hand.thumbsup")
                        .font(.subheadline)
                }
                Spacer()
                
                // save action button
                Button {
                    // TODO: add action
                } label: {
                    Image(systemName: "bookmark")
                        .font(.subheadline)
                }
            }
            .padding()
            Divider()
        }
        .padding()
    }
    
    // calculate how long ago a gift was added
    private func timeAgoCalculator(_ date: Date) -> String {
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .full
        return formatter.localizedString(for: date, relativeTo: Date())
    }
}

struct ItemRowView_Previews: PreviewProvider {
    static var previews: some View {
        GiftRowView(gift: Gift(caption: "testing",
                               timestamp: Timestamp(),
                               uid: "reed",
                               likes: 0))
    }
}
