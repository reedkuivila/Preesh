//
//  SearchRowView.swift
//  Preesh
//
//  Created by reed kuivila on 5/25/23.
//


import SwiftUI

struct SearchRowView: View {
    var product: Product
    
    // Array to store bookmarks and bday items

    
    @State private var isCakeButtonTapped = false
    @State private var isBookmarkButtonTapped = false
    @State private var isShareButtonTapped = false
    
        
    init(product: Product) {
        self.product = product
    }
    
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
                    Image(systemName: "questionmark.app")
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
                    // Add or remove item from birthday list
                    isCakeButtonTapped.toggle()
                    
                } label: {
                    Image(systemName: isCakeButtonTapped ? "birthday.cake.fill" : "birthday.cake")
                }
                
                Spacer()
                Button {
                    // Add or remove item from bookmarks
                    isBookmarkButtonTapped.toggle()
              
                } label: {
                    Image(systemName: isBookmarkButtonTapped ? "bookmark.fill" : "bookmark")
                }
                
                Spacer()
                Button {
                    // share item
                    isShareButtonTapped.toggle()
                    shareProduct()
                } label: {
                    Image(systemName: isShareButtonTapped ? "square.and.arrow.up.fill" : "square.and.arrow.up")
                }
                
                Spacer()
            }
            
            Divider()
        }
        .padding()
    }
    
    private func shareProduct() {
        let shareText = "Check out this product I added to my wishlist on Preesh!: \(product.productName)"
        let activityItems: [Any] = [shareText]
        
        DispatchQueue.main.async {
            let activityViewController = UIActivityViewController(activityItems: activityItems, applicationActivities: nil)
        }
    }
}


struct SearchRowView_Previews: PreviewProvider {
    static var previews: some View {
        SearchRowView(product: Product(id: UUID(), productName: "Example Product", imageURL: "https://example.com/image.jpg"))
    }
}
