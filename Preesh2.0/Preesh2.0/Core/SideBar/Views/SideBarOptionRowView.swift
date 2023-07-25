//
//  SideBarOptionRowView.swift
//  Preesh2.0
//
//  Created by reed kuivila on 7/25/23.
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

struct SideBarOptionRowView_Previews: PreviewProvider {
    static var previews: some View {
        SideBarOptionRowView(viewModel: .profile)
    }
}
