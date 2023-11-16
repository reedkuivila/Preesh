//
//  ImageUploader.swift
//  Preesh2.0
//
//  Created by reed kuivila on 8/8/23.
//


// sole purpose of this class is to upload images - can reuse this wherever (upload gift images etc)
import Firebase
import FirebaseStorage
import UIKit

struct ImageUploader {
    // function should give back an image URL to use image elsewhere in app
    static func uploadImage(image: UIImage, completion: @escaping(String) -> Void) {
        // compression set to 0.5 to preserve some quality while maximizing speed
        guard let imageData = image.jpegData(compressionQuality: 0.5) else { return }
        
        let filename = NSUUID().uuidString
        let ref = Storage.storage().reference(withPath: "/profile_image/\(filename)")
        
        ref.putData(imageData, metadata: nil) { _, error in
            if let error = error {
                print("DEBUG: Image upload failed with error : \(error.localizedDescription)")
                return
            }
            
            ref.downloadURL { imageUrl, _ in
                guard let imageUrl = imageUrl?.absoluteString else { return }
                completion(imageUrl)
            }
        }
    }
}

