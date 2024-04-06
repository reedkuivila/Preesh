//
//  GiftService.swift
//  Preesh4.0
//
//  Created by reed kuivila on 4/5/24.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

// no shared/static functionality so a struct works
struct GiftService {
    
    static func uploadGift(_ gift: Gift) async throws {
        guard let giftData = try? Firestore.Encoder().encode(gift) else { return }
        try await Firestore.firestore().collection("gifts").addDocument(data: giftData)   
    }
    
    static func fetchGifts() async throws -> [Gift] {
        let snapshot = try await Firestore
            .firestore()
            .collection("gifts")
            .order(by: "timestamp", descending: true)
            .getDocuments()
        
        return snapshot.documents.compactMap({ try? $0.data(as: Gift.self) })
    }
    
    
}
