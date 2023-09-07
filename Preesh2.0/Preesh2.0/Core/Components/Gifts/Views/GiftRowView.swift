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
    
    @ObservedObject var viewModel: GiftRowViewModel
    
    init(gift: Gift) {
        self.viewModel = GiftRowViewModel(gift: gift)
    }
    
    var body: some View {
        VStack {
            // username, profile image, item
            if let user = viewModel.gift.user {
                HStack(alignment: .top, spacing: 12) {
                    KFImage(URL(string: user.profileImageUrl))
                        .resizable()
                        .scaledToFill()
                        .frame(width: 64, height: 64)
                        .clipShape(Circle())
                    
                    // username/info & item added notification
                    VStack(alignment: .leading, spacing: 4) {
                        // user info & timestamp
                        HStack {
                            Text("@\(user.username)")
                                .font(.subheadline)
                                .bold()
                            
                            Text("\(timeAgoCalculator(viewModel.gift.timestamp.dateValue()))")
                                .foregroundColor(.gray)
                                .font(.caption)
                        }
                        
                        // display the item/gift added to users wish list
                        Text("\(user.fullname) added \(viewModel.gift.caption.lowercased()) to their wish list")
                            .font(.subheadline)
                            .multilineTextAlignment(.leading)
                    }
                }
            }
            
            // user action buttons
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
                    viewModel.gift.didLike ?? false ? viewModel.unlikeGift() : viewModel.likeGift()
                } label: {
                    Image(systemName: viewModel.gift.didLike ?? false ? "hand.thumbsup.fill" : "hand.thumbsup")
                        .font(.subheadline)
                        .foregroundColor(viewModel.gift.didLike ?? false ? Color("preeshBlue") : .blue)
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


//struct ItemRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        GiftRowView(gift: Gift(caption: "testing",
//                               timestamp: Timestamp(),
//                               uid: "reed",
//                               likes: 0))
//    }
//}
