//
//  UserStats.swift
//  Preesh2.0
//
//  Created by reed kuivila on 7/24/23.
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

struct UserStatsView_Previews: PreviewProvider {
    static var previews: some View {
        UserStatsView()
    }
}
