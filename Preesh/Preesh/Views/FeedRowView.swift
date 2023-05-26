//
//  FeedRowView.swift
//  Preesh
//
//  Created by reed kuivila on 5/25/23.
//


import SwiftUI

struct FeedRowView: View {
    var product: Product

    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top, spacing: 12) {
                // user profile image
                Image("MontourProfile")
                    .resizable()
                    .frame(width: 56, height: 56)
                    .clipShape(Circle())
                    .foregroundColor(CustomColor.preeshBlue)
                    .aspectRatio(contentMode: .fit)
                
                // user name & info
                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        Text("Jordan Montour")
                            .font(.subheadline)
                            .bold()
                        
                        HStack {
                            Image(systemName: "birthday.cake")
                                .font(.system(size: 10))
        
                            Text("November 1")
                                .foregroundColor(.gray)
                                .font(.caption)
                        }
                    }
                    
                    Text("Jordan added \(product.productName) item to his birthday list!")
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
                    shareProduct()
                } label: {
                    Image(systemName: "square.and.arrow.up")
                }
                
                Spacer()
            }
            
            Divider()
        }
        .padding()
    }
    private func shareProduct() {
        let shareText = "Check out this product Jordan added to his wishlist on Preesh!: \(product.productName)"
        let activityItems: [Any] = [shareText]
        
        DispatchQueue.main.async {
            let activityViewController = UIActivityViewController(activityItems: activityItems, applicationActivities: nil)
//            UIApplication.shared.windows.first?.rootViewController?.present(activityViewController, animated: true, completion: nil)
        }
    }

}

struct FeedRowView_Previews: PreviewProvider {
    static var previews: some View {
        FeedRowView(product: Product(id: UUID(), productName: "Example Product", imageURL: "https://example.com/image.jpg"))
    }
}

