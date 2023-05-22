//
//  HomeFeedView.swift
//  Preesh
//
//  Created by reed kuivila on 5/18/23.
//

import SwiftUI

struct HomeFeedView: View {
    var body: some View {
        Spacer()
        Image(systemName: "gift.fill")
            .font(.system(size: 40))
            .imageScale(.large)
            .foregroundColor(.accentColor)
        Text("Welcome to preesh!")
            .font(.system(size: 25))    }
}

struct HomeFeedView_Previews: PreviewProvider {
    static var previews: some View {
        HomeFeedView()
    }
}
