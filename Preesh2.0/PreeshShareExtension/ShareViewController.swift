//
//  ShareViewController.swift
//  PreeshShareExtension
//
//  Created by reed kuivila on 11/16/23.
//

//


import UIKit
import Social

class ShareViewController: SLComposeServiceViewController {

    override func isContentValid() -> Bool {
        // Validate the shared content here if needed
        return !contentText.isEmpty
    }

    override func didSelectPost() {
        let userDefaults = UserDefaults(suiteName: "group.preesh2")
        userDefaults?.set(contentText, forKey: "sharedCaption")
        
        // Signal that the post action is completed
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
