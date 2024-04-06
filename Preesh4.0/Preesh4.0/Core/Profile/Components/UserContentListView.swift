//
//  UserContentListView.swift
//  Preesh4.0
//
//  Created by reed kuivila on 3/28/24.
//

import SwiftUI
import Firebase

struct UserContentListView: View {
    @State private var selectedFilter: ProfileFilter = .wishList
    @Namespace var animation
    
    var body: some View {
        VStack {
            HStack {
                ForEach(ProfileFilter.allCases) {
                    filter in
                    VStack {
                        Text(filter.title)
                            .font(.subheadline)
                            .fontWeight(selectedFilter == filter ? .semibold :
                                    .regular)
                        
                        if selectedFilter == filter {
                            Capsule()
                                .foregroundColor(Color("preeshBlue"))
                                .frame(height: 3)
                                .matchedGeometryEffect(id: "item", in: animation)
                            
                        } else {
                            Capsule()
                                .foregroundColor(Color(.clear))
                                .frame(height: 3)
                            
                        }
                    }
                    .onTapGesture {
                        withAnimation(.spring()) {
                            self.selectedFilter = filter
                        }
                    }
                }
            }
            
            LazyVStack {
                ForEach(0...19, id: \.self) { gift in
                    GiftCell(gift: Gift(ownerUid: "123",
                                  giftName: "test gift",
                                  timestamp: Timestamp(),
                                  likes: 0))
                }
            }
        }
        .padding(.vertical, 8)
    }
}

#Preview {
    UserContentListView()
}
