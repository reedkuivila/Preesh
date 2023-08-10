//
//  ItemRowView.swift
//  Preesh2.0
//
//  Created by reed kuivila on 7/20/23.
//

// MARK: individual cell to show when a user adds an item to their list

import SwiftUI

struct ItemRowView: View {
    let item: Item
    
    var body: some View {
        VStack {
            
            // username, profile image, item
            HStack(alignment: .top, spacing: 12) {
                Circle()
                    .frame(width: 56, height: 56)
                    .foregroundColor(Color(.systemBlue))
                
                // username/info & item added notification
                VStack(alignment: .leading, spacing: 4) {
                    // user info & timestamp
                    HStack {
                        Text("Jordan Montour")
                            .font(.subheadline)
                            .bold()
                        
                        Text("@montour")
                            .foregroundColor(.gray)
                            .font(.caption)
                        
                        Text("8 Minutes")
                            .foregroundColor(.gray)
                            .font(.caption)
                    }
                    
                    // item added
                    Text(item.caption)
                        .font(.subheadline)
                        .multilineTextAlignment(.leading)
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
}

//struct ItemRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        ItemRowView(item: item)
//    }
//}
