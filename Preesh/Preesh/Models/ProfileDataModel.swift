//
//  ProfileDataModel.swift
//  Preesh
//
//  Created by reed kuivila on 5/23/23.
//

import Foundation
import SwiftUI
import CoreLocation
import UserNotifications

struct ImageEntry: Codable, Hashable {
    var image: Data
}

@MainActor class ImageData: ObservableObject {
    static let shared = ImageData()

    private let IMAGES_KEY = "ImagesKey"

    @Published var imageEntry: [ImageEntry] {
        didSet {
            objectWillChange.send()
            saveEntryData()
        }
    }

    @Published var mostRecentImage: Data? {
        didSet {
            UserDefaults.standard.set(mostRecentImage, forKey: "mostRecentImageData")
        }
    }

    init() {
        if let data = UserDefaults.standard.data(forKey: IMAGES_KEY) {
            if let decodedEntries = try? JSONDecoder().decode([ImageEntry].self, from: data) {
                imageEntry = decodedEntries
                print("entry information retrieved")
            } else {
                imageEntry = []
            }
        } else {
            imageEntry = []
        }

        mostRecentImage = UserDefaults.standard.data(forKey: "mostRecentImageData")
    }

    func addEntry(image: UIImage) {
        if let imageData = image.jpegData(compressionQuality: 0.8) {
            mostRecentImage = imageData

            if let pngRepresentation = image.pngData() {
                let tempEntry = ImageEntry(image: pngRepresentation)
                imageEntry.insert(tempEntry, at: 0)
                print("entry added")
                saveEntryData()
            }
        }
    }

    private func saveEntryData() {
        if let encodedEntries = try? JSONEncoder().encode(imageEntry) {
            UserDefaults.standard.set(encodedEntries, forKey: IMAGES_KEY)
        }
    }

    func resetUserData() {
        // Reset all the saved data
        UserDefaults.standard.removeObject(forKey: "ImagesKey")
        UserDefaults.resetStandardUserDefaults()

        imageEntry = []
    }
}




