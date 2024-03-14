//
//  CircularProfileImageView.swift
//  Preesh4.0
//
//  Created by reed kuivila on 3/11/24.
//

import SwiftUI

struct CircularProfileImageView: View {
    var picWidth: CGFloat = 40
    var picHeight: CGFloat = 40
    
    
    var body: some View {
        Image(systemName: "person.crop.circle.fill")
            .resizable()
            .foregroundColor(.gray)
//            .scaledToFill()
            .clipShape(Circle())
            .frame(width: picWidth, height: picHeight)
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
