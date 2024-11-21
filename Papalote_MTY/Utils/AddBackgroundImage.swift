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











/*
func addBorderToImage(_ photo: UIImage, zonaColor: Color, borderWidth: CGFloat = 150) -> UIImage {
    // Reduce the image size if it's very large
    let maxDimension: CGFloat = 2048 // Limit to 2048x2048 pixels
    var scaledImage = photo
    
    if photo.size.width > maxDimension || photo.size.height > maxDimension {
        let scale = min(maxDimension / photo.size.width, maxDimension / photo.size.height)
        let newSize = CGSize(width: photo.size.width * scale, height: photo.size.height * scale)
        
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0)
        photo.draw(in: CGRect(origin: .zero, size: newSize))
        scaledImage = UIGraphicsGetImageFromCurrentImageContext() ?? photo
        UIGraphicsEndImageContext()
    }
    
    let borderColor = UIColor(zonaColor)
    let size = CGSize(
        width: scaledImage.size.width + 2 * borderWidth,
        height: scaledImage.size.height + 2 * borderWidth
    )
    
    // Use lower-level CoreGraphics for potentially better memory management
    UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
    
    guard let context = UIGraphicsGetCurrentContext() else {
        return scaledImage
    }
    
    // Draw border as a rectangle
    let borderRect = CGRect(origin: .zero, size: size)
    context.setFillColor(borderColor.cgColor)
    context.fill(borderRect)
    
    // Draw image inside the border
    let imageRect = CGRect(origin: CGPoint(x: borderWidth, y: borderWidth), size: scaledImage.size)
    scaledImage.draw(in: imageRect)
    
    // Draw text over the image and border
    let text = "Hello" as NSString
    let font = UIFont.systemFont(ofSize: 60, weight: .bold)
    let textColor = UIColor.black
    
    let textSize = text.size(withAttributes: [.font: font])
    let textRect = CGRect(
        x: (size.width - textSize.width) / 2,
        y: (size.height - textSize.height) / 2 - 1120, // Keep the desired position
        width: textSize.width,
        height: textSize.height
    )
    
    text.draw(in: textRect, withAttributes: [
        .font: font,
        .foregroundColor: textColor
    ])
    
    // Get final image
    let finalImage = UIGraphicsGetImageFromCurrentImageContext() ?? scaledImage
    UIGraphicsEndImageContext()
    
    return finalImage
}
*/

func addBorderToImage(_ photo: UIImage, zonaColor: Color, borderWidthTopBottom: CGFloat = 280, borderWidthLeftRight: CGFloat = 150, zona: String) -> UIImage {
    // Reduce the image size if it's very large
    let maxDimension: CGFloat = 2048 // Limit to 2048x2048 pixels
    var scaledImage = photo
    
    if photo.size.width > maxDimension || photo.size.height > maxDimension {
        let scale = min(maxDimension / photo.size.width, maxDimension / photo.size.height)
        let newSize = CGSize(width: photo.size.width * scale, height: photo.size.height * scale)
        
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0)
        photo.draw(in: CGRect(origin: .zero, size: newSize))
        scaledImage = UIGraphicsGetImageFromCurrentImageContext() ?? photo
        UIGraphicsEndImageContext()
    }
    
    let borderColor = UIColor(zonaColor)
    let size = CGSize(
        width: scaledImage.size.width + 2 * borderWidthLeftRight,
        height: scaledImage.size.height + 2 * borderWidthTopBottom
    )
    
    // Use lower-level CoreGraphics for potentially better memory management
    UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
    
    guard let context = UIGraphicsGetCurrentContext() else {
        return scaledImage
    }
    
    // Draw border as a rectangle
    let borderRect = CGRect(origin: .zero, size: size)
    context.setFillColor(borderColor.cgColor)
    context.fill(borderRect)
    
    // Draw image inside the adjusted border
    let imageRect = CGRect(
        origin: CGPoint(x: borderWidthLeftRight, y: borderWidthTopBottom),
        size: scaledImage.size
    )
    scaledImage.draw(in: imageRect)
    
    // Draw text over the image and border
    
    //  .font(Font.custom("VagRoundedBold", size: 40))
    var text = "Papalote MTY" as NSString
    let font = UIFont.systemFont(ofSize: 150, weight: .bold)
    //let font = Font.custom("VagRoundedBold", size: 40)
    let textColor = UIColor.white
    
    
    
    // Draws On Top
    var textSize = text.size(withAttributes: [.font: font])
    var textRect = CGRect(
        x: (size.width - textSize.width) / 2,
        y: (size.height - textSize.height) / 2 - 1170, // Keep the desired position
        width: textSize.width,
        height: textSize.height
    )
    
    text.draw(in: textRect, withAttributes: [
        .font: font,
        .foregroundColor: textColor
    ])
    
    
    // Draws on Bottom
    
    // Draws On Top
    
    text = zona as NSString
    textSize = text.size(withAttributes: [.font: font])
    textRect = CGRect(
        x: (size.width - textSize.width) / 2,
        y: (size.height - textSize.height) / 2 + 1170, // Keep the desired position
        width: textSize.width,
        height: textSize.height
    )
    
    text.draw(in: textRect, withAttributes: [
        .font: font,
        .foregroundColor: textColor
    ])
    
    print("this was the width of the text: ", text)
    print(textSize.width)
    
    
    // Get final image
    let finalImage = UIGraphicsGetImageFromCurrentImageContext() ?? scaledImage
    UIGraphicsEndImageContext()
    
    return finalImage
}

