//
//  UserRowView.swift
//  Preesh2.0
//
//  Created by reed kuivila on 7/24/23.
//

import SwiftUI

struct UserRowView: View {
    var body: some View {
        HStack {
            Circle()
                .frame(width: 48, height: 48)
            
            VStack(alignment: .leading, spacing: 4) {
                Text("Jordan Montour")
                    .font(.subheadline)
                    .bold()
                    .foregroundColor(.black)
                
                Text("@montour")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
        }
        .padding(.horizontal)
        .padding(.vertical, 4)
    }
}

struct UserRowView_Previews: PreviewProvider {
    static var previews: some View {
        UserRowView()
    }
}
