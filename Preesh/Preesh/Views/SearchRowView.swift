//
//  SearchRowView.swift
//  Preesh
//
//  Created by reed kuivila on 5/25/23.
//


import SwiftUI

struct SearchRowView: View {
    var product: Product

    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top, spacing: 12) {
                // should be item image
                AsyncImage(url: URL(string: product.imageURL)) { image in
                         image
                             .resizable()
                             .frame(width: 75, height: 110)
                             .foregroundColor(CustomColor.preeshBlue)
                             .aspectRatio(contentMode: .fit)
                     } placeholder: {
                         Image(systemName: "")
                             .resizable()
                             .frame(width: 56, height: 56)
                             .clipShape(Circle())
                             .foregroundColor(CustomColor.preeshBlue)
                             .aspectRatio(contentMode: .fit)
                     }
                // user name & info
                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        Text("\(product.productName)")
                            .font(.subheadline)
                            .bold()
                    }
                }
            }
            
            // user actions to bookmark items
            HStack {
                Spacer()
                Button {
                    // bookmark item
                } label: {
                    Image(systemName: "birthday.cake")
                }
                
                Spacer()
                Button {
                    // share item
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
            }
            
            Divider()
        }
        .padding()
    }
}

struct SearchRowView_Previews: PreviewProvider {
    static var previews: some View {
        FeedRowView(product: Product(id: UUID(), productName: "Example Product", imageURL: "https://example.com/image.jpg"))
    }
}

