//
//  ShareData.swift
//  RegularShareExtension
//
//  Created by reed kuivila on 11/16/23.
//


import SwiftUI
import Combine

class ShareData: ObservableObject {
    @Published var receivedText: String = ""
    @Published var savedItems: [SavedItem] = []

    init() {
        // Load the shared data here
        if let sharedItems = NSExtensionContext.current?.inputItems as? [NSExtensionItem] {
            for item in sharedItems {
                if let itemProvider = item.attachments?.first {
                    itemProvider.loadItem(forTypeIdentifier: "public.text") { (text, error) in
                        if let text = text as? String {
                            DispatchQueue.main.async {
                                self.receivedText = text
                            }
                        }
                    }
                }
            }
        }
    }

    // Function to save a new item
    func saveItem(url: String) {
        let newItem = SavedItem(url: url)
        savedItems.append(newItem)
    }
}
