//
//  ImageUploader.swift
//  Preesh4.0
//
//  Created by reed kuivila on 3/28/24.
//

import Foundation
import Firebase
import FirebaseStorage

/// see info on data compression and photo quality here:
/// https://developer.apple.com/documentation/uikit/uiimage/1624115-jpegdata


struct ImageUploader {
    static func uploadImage(_ image: UIImage) async throws -> String? {
        guard let imageData = image.jpegData(compressionQuality: 0.25) else { return nil }
        let filename = NSUUID().uuidString
        let storageRef = Storage.storage().reference(withPath: "/profile_images/\(filename)")
        
        do {
            let _ = try await storageRef.putDataAsync(imageData)
            let url = try await storageRef.downloadURL()
            return url.absoluteString
        } catch {
            print("DEBUG: failed to upload image with error \(error.localizedDescription)")
            return nil
        }
    }
}
