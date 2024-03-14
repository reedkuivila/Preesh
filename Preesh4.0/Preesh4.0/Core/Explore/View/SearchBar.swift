//
//  SearchBar.swift
//  Preesh4.0
//
//  Created by reed kuivila on 3/11/24.
//

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

#Preview {
    SearchBar(text: .constant(""))
}
