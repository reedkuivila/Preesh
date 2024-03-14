//
//  ExploreView.swift
//  Preesh4.0
//
//  Created by reed kuivila on 3/11/24.
//

import SwiftUI

struct ExploreView: View {
    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: .constant(""))
                ScrollView {
                    LazyVStack {
                        // TODO: add for each and put user data here
                        ForEach(0...10, id: \.self) { user in
                            VStack {
                                HStack {
                                    UserRowView(user: User(id: "",
                                                           username: "mungus",
                                                           fullname: "Jordan Mungus",
                                                           profileImageUrl: "",
                                                           email: "mungus@mungo.edu"))
                                }
                                .padding(.horizontal)
                                Divider()
                            }
                        }
                    }
                }
            }
            .navigationTitle("Explore")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}


#Preview {
    ExploreView()
}
