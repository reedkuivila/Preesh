//
//  AuthHeaderView.swift
//  Preesh2.0
//
//  Created by reed kuivila on 8/3/23.
//

import SwiftUI

struct AuthHeaderView: View {
    let title1: String
    let title2: String
    var body: some View {
        VStack {
            
            // header view
            VStack(alignment: .leading) {
                HStack { Spacer() }
                
                Text(title1)
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                
                Text(title2)
                    .font(.title)
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

struct AuthHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        AuthHeaderView(title1: "hello", title2: "hello")
    }
}
