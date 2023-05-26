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
        ScrollView {
            LazyVStack {
                // iterate over the array pf products
                ForEach(datas.products) { product in 
                    // pass in each product into the FeedRowView
                    FeedRowView(product: product)
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
