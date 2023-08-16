//
//  FeedViewMode.swift
//  Preesh2.0
//
//  Created by reed kuivila on 8/10/23.
//

import Firebase
import FirebaseFirestoreSwift
import Foundation

class FeedViewModel: ObservableObject {
    @Published var gifts = [Gift]()
    let service = GiftService()
    let userService = UserService()

    init() {
        fetchGifts()
    }

    func fetchGifts() {
        service.fetchGifts { gifts in
            self.gifts = gifts
            
            for i in 0 ..< gifts.count {
                let uid = gifts[i].uid
                    
                self.userService.fetchUser(withUid: uid) { user in
                    self.gifts[i].user = user
                }
            }
            
            
            
            // DEBUG: check authentication & how many gifts there are
            print("Fetched \(gifts.count) gifts")

            if let user = Auth.auth().currentUser {
                print("User is authenticated: \(user.uid)")
            } else {
                print("User is not authenticated")
            }
        }
    }
}
