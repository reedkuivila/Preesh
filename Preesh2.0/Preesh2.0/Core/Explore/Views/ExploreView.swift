//
//  ExploreView.swift
//  Preesh2.0
//
//  Created by reed kuivila on 7/20/23.
//

import SwiftUI

struct ExploreView: View {
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    LazyVStack {
                        ForEach(0...25, id: \.self) { _ in
                            NavigationLink {
//                                ProfileView()
//                                    .navigationBarHidden(true)
                            } label: {
                                UserRowView()
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

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}
