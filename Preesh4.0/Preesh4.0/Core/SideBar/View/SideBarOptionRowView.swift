//
//  SideBarOptionRowView.swift
//  Preesh4.0
//
//  Created by reed kuivila on 3/13/24.
//

import SwiftUI

struct SideBarOptionRowView: View {
    let viewModel: SideBarViewModel

    var body: some View {
        HStack {
            Image(systemName: viewModel.imageName)
                .font(.headline)
                .foregroundColor(.gray)
            
            Text(viewModel.title)
                .foregroundColor(.black)
                .font(.subheadline)
            
            Spacer()
        }
        .frame(height: 40)
        .padding(.horizontal)
    }
}

#Preview {
    SideBarOptionRowView(viewModel: .profile)
}
