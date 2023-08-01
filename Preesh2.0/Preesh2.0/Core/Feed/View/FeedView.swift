//
//  FeedView.swift
//  Preesh2.0
//
//  Created by reed kuivila on 7/18/23.
//

import SwiftUI

struct FeedView: View {
    @State private var showAddItemView = false
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ScrollView {
                LazyVStack {
                    ForEach(0...20, id: \.self) { _ in
                        ItemRowView()
                    }
                }
            }
//            Button {
//                showAddItemView.toggle()
//                print("search for an item")
//            } label: {
//                Image(systemName: "plus")
//                    .resizable()
//                    .renderingMode(.template)
//                    .frame(width: 28, height: 28)
//                    .padding()
//            }
//            .background(Color("preeshBlue"))
//            .foregroundColor(.white)
//            .clipShape(Circle())
//            .offset(y: 32)
//            .padding()
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
