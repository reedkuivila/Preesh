//
//  SearchRowView.swift
//  Preesh
//
//  Created by reed kuivila on 5/25/23.
//


import SwiftUI

struct SearchRowView: View {
    var product: Product
    
    @State private var isCakeButtonTapped = false
    @State private var isBookmarkButtonTapped = false
    @State private var isShareButtonTapped = false
    
//    private let birthdayListKey = "BirthdayList"
//    private let bookmarksListKey = "BookmarksList"
        
    init(product: Product) {
        self.product = product
        // Load the initial state of the buttons from UserDefaults or other storage
        _isCakeButtonTapped = State(initialValue: UserDefaults.standard.bool(forKey: "\(String(describing: product.id))-cake"))
        _isBookmarkButtonTapped = State(initialValue: UserDefaults.standard.bool(forKey: "\(String(describing: product.id))-bookmark"))
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
                    // add item to birthday list
                    isCakeButtonTapped.toggle()
                    // Save the state of the cake button
                    UserDefaults.standard.set(isCakeButtonTapped, forKey: "\(String(describing: product.id))-cake")
                } label: {
                    Image(systemName: isCakeButtonTapped ? "birthday.cake.fill" : "birthday.cake")
                }
                
                Spacer()
                Button {
                    // add item to bookmarks
                    isBookmarkButtonTapped.toggle()
                    // Save the state of the bookmark button
                    UserDefaults.standard.set(isBookmarkButtonTapped, forKey: "\(String(describing: product.id))-bookmark")
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
//            UIApplication.shared.windows.first?.rootViewController?.present(activityViewController, animated: true, completion: nil)
        }
    }
}


struct SearchRowView_Previews: PreviewProvider {
    static var previews: some View {
        SearchRowView(product: Product(id: UUID(), productName: "Example Product", imageURL: "https://example.com/image.jpg"))
    }
}
