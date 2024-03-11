//
//  CircularProfileImageView.swift
//  Preesh4.0
//
//  Created by reed kuivila on 3/11/24.
//

import SwiftUI

struct CircularProfileImageView: View {
    var body: some View {
        Image(systemName: "person.fill")
            .resizable()
            .scaledToFill()
            .clipShape(Circle())
            .frame(width: 40, height: 40)
    }
}

#Preview {
    CircularProfileImageView()
}
