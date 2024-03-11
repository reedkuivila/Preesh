//
//  GiftCell.swift
//  Preesh4.0
//
//  Created by reed kuivila on 3/11/24.
//

import SwiftUI

struct GiftCell: View {
    var body: some View {
        VStack {
            HStack(alignment: .top, spacing: 12) {
                CircularProfileImageView()
                
                VStack {
                    HStack {
                        Text("@username")
                            .font(.footnote)
                            .fontWeight(.semibold)
                        
                        Spacer()
                        
                        Text("Timestamp")
                            .foregroundColor(.gray)
                            .font(.caption)
                    }
                    
                    Text("Montour added cast iron pan to his wish lsit.")
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
    GiftCell()
}
