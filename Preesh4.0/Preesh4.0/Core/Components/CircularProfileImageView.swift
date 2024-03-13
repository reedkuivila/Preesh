//
//  CircularProfileImageView.swift
//  Preesh4.0
//
//  Created by reed kuivila on 3/11/24.
//

import SwiftUI

struct CircularProfileImageView: View {
    var body: some View {
        Image(systemName: "person.crop.circle.fill")
            .resizable()
            .foregroundColor(.gray)
//            .scaledToFill()
            .clipShape(Circle())
            .frame(width: 40, height: 40)
            .overlay {
                Circle()
                    .stroke(Color("preeshBlue"), lineWidth: 2)
//                        .stroke(Color(.systemGray4), lineWidth: 1)

            }
    }
}

#Preview {
    CircularProfileImageView()
}
