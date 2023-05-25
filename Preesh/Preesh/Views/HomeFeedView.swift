//
//  HomeFeedView.swift
//  Preesh
//
//  Created by reed kuivila on 5/18/23.
//

import SwiftUI

struct HomeFeedView: View {
    @ObservedObject var datas = ReadData()

    var body: some View {
        //        Spacer()
        //        Image(systemName: "gift.fill")
        //            .font(.system(size: 40))
        //            .imageScale(.large)
        //            .foregroundColor(.accentColor)
        //        Text("Welcome to preesh!")
        //            .font(.system(size: 25))
        
        ScrollView {
            LazyVStack {
                ForEach(datas.products) { product in // Iterate over the products array
                    FeedRowView(product: product) // Pass each product to the FeedRowView
                }
            }
        }
    }
}


struct HomeFeedView_Previews: PreviewProvider {
    static var previews: some View {
        HomeFeedView()
    }
}
