//
//  ShareViewController.swift
//  PreeshShareExtension
//
//  Created by reed kuivila on 11/16/23.
//


import UIKit
import Social

class ShareViewController: SLComposeServiceViewController {

    override func isContentValid() -> Bool {
        // Do validation of contentText and/or NSExtensionContext attachments here
        return true
    }

    override func didSelectPost() {
        guard let extensionItems = extensionContext?.inputItems as? [NSExtensionItem],
              let item = extensionItems.first,
              let attachments = item.attachments else {
            self.extensionContext!.completeRequest(returningItems: [], completionHandler: nil)
            return
        }

        for attachment in attachments {
            if attachment.hasItemConformingToTypeIdentifier("public.image") {
                attachment.loadItem(forTypeIdentifier: "public.image", options: nil) { [weak self] (item, error) in
                    if let image = item as? UIImage {
                        // Handle the shared image here
                        self?.handleSharedImage(image)
                    }
                }
            }
        }

        self.extensionContext!.completeRequest(returningItems: [], completionHandler: nil)
    }

    private func handleSharedImage(_ image: UIImage) {
        // Perform any necessary processing or save the shared image
        // to a shared location (e.g., UserDefaults or a file)
        // for the main app to access and display it.
    }

    override func configurationItems() -> [Any]! {
        // To add configuration options via table cells at the bottom of the sheet, return an array of SLComposeSheetConfigurationItem here.
        return []
    }

}
