//
//  FeedRowView.swift
//  Preesh
//
//  Created by reed kuivila on 5/25/23.
//

import SwiftUI

struct FeedRowView: View {
    var body: some View {
        VStack(alignment: .leading){
            
            HStack(alignment: .top, spacing: 12) {
                // user profile image
                Image(systemName: "person.circle")
                    .resizable()
                    .frame(width: 56, height: 56)
                    .clipShape(Circle())
                    .foregroundColor(CustomColor.preeshBlue)
                    .aspectRatio(contentMode: .fit)
                
                // user name & info
                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        Text("Preesh user")
                            .font(.subheadline)
                            .bold()
                        
                        Text("user birthday")
                            .foregroundColor(.gray)
                            .font(.caption)
                    }
                    
                    Text("Reed added item to his list!")
                        .font(.subheadline)
                        .multilineTextAlignment(.leading)
                }
            }
            // user actions to bookmark items
            HStack {
                Spacer()
                Button {
                    // bookmark item
                } label: {
                    Image(systemName: "bookmark")
                }
                
                Spacer()
                Button {
                    // share item
                } label: {
                    Image(systemName: "square.and.arrow.up")
                }
                
                Spacer()
                Spacer()
            }
            Divider()
        }
        .padding()
    }
}

struct FeedRowView_Previews: PreviewProvider {
    static var previews: some View {
        FeedRowView()
    }
}
