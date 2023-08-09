//
//  SearchBar.swift
//  Preesh2.0
//
//  Created by reed kuivila on 8/9/23.
//

// custom search bar for explore view
// NB the built in swiftUI search bar feature only works with lists
// to keep the scroll view in the explore feed implement custom search/filter


import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    var body: some View {
        HStack {
            TextField("search for friends", text: $text)
                .autocorrectionDisabled(true)
                .padding(8)
                .padding(.horizontal, 24)
                .background(Color(.gray).opacity(0.1))
                .cornerRadius(20)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 7)
                    })
        }
        .padding(.horizontal)
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(text: .constant(""))
    }
}
