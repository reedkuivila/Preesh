//
//  UserStatsView.swift
//  Preesh4.0
//
//  Created by reed kuivila on 3/13/24.
//

import SwiftUI

struct UserStatsView: View {
    var body: some View {
        HStack(spacing: 4) {
            Text("32")
                .font(.subheadline)
                .bold()
            
            Text("friends")
                .font(.caption)
                .bold()
                .foregroundColor(.gray)
        }
    }
}


#Preview {
    UserStatsView()
}
