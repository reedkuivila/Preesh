//
//  AuthHeaderView.swift
//  Preesh4.0
//
//  Created by reed kuivila on 3/11/24.
//

import SwiftUI

struct AuthHeaderView: View {
    let title1: String
    let title2: String
    let fontSize: CGFloat // New property to set font size
    
    init(title1: String, title2: String, fontSize: CGFloat = 24) {
        self.title1 = title1
        self.title2 = title2
        self.fontSize = fontSize
    }
    
    var body: some View {
        VStack {
            
            // header view
            VStack(alignment: .leading) {
                HStack { Spacer() }
                
                Text(title1)
                    .font(.system(size: fontSize, weight: .semibold)) // Use custom font size
                    .fontWeight(.semibold)
                
                Text(title2)
                    .font(.system(size: fontSize - 6, weight: .semibold)) // You can adjust the font size here as needed
                    .fontWeight(.semibold)
            }
            .frame(height: 260)
            .padding(.leading)
            .background(Color("preeshBlue"))
            .foregroundColor(.white)
            .clipShape(RoundedShape(corners: [.bottomRight]))
        }
    }
}

struct RoundedShape: Shape {
    var corners: UIRectCorner
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: 80, height: 80))
        
        return Path(path.cgPath)
    }
}

#Preview {
    AuthHeaderView(title1: "TEST", title2: "TEST", fontSize: 20)
}

//struct AuthHeaderView_Previews: PreviewProvider {
//    static var previews: some View {
//        AuthHeaderView(title1: "hello", title2: "hello", fontSize: 32) // You can adjust the font size here for preview
//    }
//}
