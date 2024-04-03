//
//  CircularProfileImageView.swift
//  Preesh4.0
//
//  Created by reed kuivila on 3/11/24.
//

import SwiftUI
import Kingfisher

enum ProfileImageSize {
    case xxSmall
    case xSmall
    case small
    case medium
    case large
    case xLarge
    
    var dimension: CGFloat {
        switch self {
        case .xxSmall: return 28
        case .xSmall: return 32
        case .small: return 40
        case .medium: return 48
        case .large: return 64
        case .xLarge: return 80
        }
    }
}

struct CircularProfileImageView: View {
    var user: User?
    let size: ProfileImageSize
    
    var body: some View {
        if let imageUrl = user?.profileImageUrl {
            KFImage(URL(string: imageUrl))
                .resizable()
                .scaledToFill()
                .frame(width: size.dimension, height: size.dimension)
                .clipShape(Circle())
        } else {
            Image(systemName: "person.crop.circle.fill")
                .resizable()
                .foregroundColor(.gray)
            //            .scaledToFill()
                .clipShape(Circle())
                .frame(width: size.dimension, height: size.dimension)
                .overlay {
                    Circle()
                        .stroke(Color("preeshBlue"), lineWidth: 2)
                    //                        .stroke(Color(.systemGray4), lineWidth: 1)
                    
                }
        }
    }
}

#Preview {
    CircularProfileImageView(user: User(id: "",
                                  fullname: "mungus",
                                  email: "Jordan Mungus",
                                  username: "@mungus",
                                        profileImageUrl: "mungus@mungo.edu"), size: .medium)
}
