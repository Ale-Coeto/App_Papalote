//
//  InstagramSharingUtils.swift
//  Papalote_MTY
//
//  Created by Rodrigo Garcia on 26/10/24.
//


import Foundation
import SwiftUI

struct InstagramSharingUtils {

    // Returns a URL if Instagram Stories can be opened, otherwise returns nil.
    private static var instagramStoriesUrl: URL? {
        if let url = URL(string: "instagram-stories://share?source_application=your-app-bundle-identifier") {
            if UIApplication.shared.canOpenURL(url) {
                return url
            }
        }
        return nil
    }

    // Convenience wrapper to return a boolean for `instagramStoriesUrl`
    static var canOpenInstagramStories: Bool {
        return instagramStoriesUrl != nil
    }

    // If Instagram Stories is available, writes the image to the pasteboard and opens Instagram.
    static func shareToInstagramStories(_ image: UIImage) {
        // Check that Instagram Stories is available.
        guard let instagramStoriesUrl = instagramStoriesUrl else {
            return
        }

        // Convert the image to data that can be written to the pasteboard.
        guard let imageData = image.pngData() else {
            print("🙈 Image data not available.")
            return
        }
        let pasteboardItem = ["com.instagram.sharedSticker.backgroundImage": imageData]
        let pasteboardOptions = [UIPasteboard.OptionsKey.expirationDate: Date().addingTimeInterval(60 * 5)]

        // Add the image to the pasteboard. Instagram will read the image from the pasteboard when it's opened.
        UIPasteboard.general.setItems([pasteboardItem], options: pasteboardOptions)

        // Open Instagram.
        UIApplication.shared.open(instagramStoriesUrl, options: [:], completionHandler: nil)
    }
}
