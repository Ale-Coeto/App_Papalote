//
//  AddBackgroundImage.swift
//  Papalote_MTY
//
//  Created by Rodrigo Garcia on 19/11/24.
//
import SwiftUI
import SwiftData
import UIKit
import Photos

func addBorderToImage(_ image: UIImage, borderColor: UIColor, borderWidth: CGFloat, cornerRadius: CGFloat) -> UIImage {
    let size = CGSize(width: image.size.width + 2 * borderWidth, height: image.size.height + 2 * borderWidth)
    UIGraphicsBeginImageContextWithOptions(size, false, 0)
    
    let rect = CGRect(origin: CGPoint(x: borderWidth, y: borderWidth), size: image.size)
    let borderRect = CGRect(origin: .zero, size: size)
    
    // Draw rounded border
    let path = UIBezierPath(roundedRect: borderRect, cornerRadius: cornerRadius)
    borderColor.setFill()
    path.fill()
    
    // Draw the image inside the rounded border
    let imagePath = UIBezierPath(roundedRect: rect, cornerRadius: cornerRadius - borderWidth)
    imagePath.addClip()
    image.draw(in: rect)
    
    // Add "Papalote MTY" text in white
    let text = "Papalote MTY"
    let textAttributes: [NSAttributedString.Key: Any] = [
        .font: UIFont.boldSystemFont(ofSize: 24),  // Font size and style
        .foregroundColor: UIColor.white          // Text color
    ]
    
    let textSize = text.size(withAttributes: textAttributes)
    let textRect = CGRect(
        x: (size.width - textSize.width) / 2,     // Center horizontally
        y: size.height - textSize.height - 20,   // Position near the bottom with padding
        width: textSize.width,
        height: textSize.height
    )
    
    text.draw(in: textRect, withAttributes: textAttributes)
    
    // Capture the final image with border and text
    let borderedImageWithText = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    
    return borderedImageWithText ?? image
}
