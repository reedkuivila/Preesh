//
//  SearchView.swift
//  Preesh
//
//  Created by reed kuivila on 5/25/23.
//

import SwiftUI

struct SearchView: View {
    @Binding var searchText: String
    @ObservedObject var datas = ReadData()


    var body: some View {
        VStack {
            SearchBar(text: $searchText)

            // Display the search results based on the searchText
            Text("Products matching: \(searchText)")
                .font(.custom("times", size: 20))
                .foregroundColor(CustomColor.preeshBlue)
                .padding()
            
            List {
                ScrollView {
                    LazyVStack {
                        ForEach(datas.products.filter { product in
                                searchText.isEmpty ||
                                product.productName.localizedCaseInsensitiveContains(searchText)
                        }) { product in // Iterate over the products array
                            SearchRowView(product: product) // Pass each product to the FeedRowView
                        }
                    }
                }
            .listStyle(.plain)
            .refreshable{}

            }
            // Add your own custom view to show the search results here
            
            Spacer()
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(searchText: .constant(""))
    }
}

struct SearchBar: View {
    @Binding var text: String
    
    var body: some View {
        HStack {
            TextField("Search", text: $text)
                .padding(.horizontal, 10)
                .padding(.vertical, 8)
                .autocorrectionDisabled(true)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)

            
            Button(action: {
                // Perform search action here
                // You can update the search results based on the entered text
            }) {
                Image(systemName: "magnifyingglass")
                    .font(.title2)
                    .foregroundColor(.gray)
            }
        }
        .padding(.horizontal)
    }
}
