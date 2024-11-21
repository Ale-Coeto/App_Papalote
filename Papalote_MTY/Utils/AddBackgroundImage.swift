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

/*func addBorderToImage(_ image: UIImage, zonaColor: UIColor, borderWidth: CGFloat = 150, cornerRadius: CGFloat = 150) -> UIImage {
   print("at least entered the function")
   //return image
   //print("Border added")
   //return image
   let size = CGSize(width: image.size.width + 2 * borderWidth, height: image.size.height + 2 * borderWidth)
   UIGraphicsBeginImageContextWithOptions(size, false, 0)
   
   let rect = CGRect(origin: CGPoint(x: borderWidth, y: borderWidth), size: image.size)
   let borderRect = CGRect(origin: .zero, size: size)
   
   // Draw rounded border
   let path = UIBezierPath(roundedRect: borderRect, cornerRadius: cornerRadius)
   zonaColor.setFill()
   path.fill()
   
   // Draw the image inside the rounded border
   let imagePath = UIBezierPath(roundedRect: rect, cornerRadius: cornerRadius - borderWidth)
   imagePath.addClip()
   image.draw(in: rect)
   //return image
   // Add "Papalote MTY" text in white
   let text = "Papalote MTY"
   let textAttributes: [NSAttributedString.Key: Any] = [
       .font: UIFont.boldSystemFont(ofSize: 24),
       .foregroundColor: UIColor.white
   ]
   
   let textSize = text.size(withAttributes: textAttributes)
   let textRect = CGRect(
       x: (size.width - textSize.width) / 2,
       y: size.height - textSize.height - 20,
       width: textSize.width,
       height: textSize.height
   )
   
   text.draw(in: textRect, withAttributes: textAttributes)
   
    //return image
   // Capture the final image
   let borderedImageWithText = UIGraphicsGetImageFromCurrentImageContext()
   UIGraphicsEndImageContext()
   
   // Ensure the image is saved as PNG or JPEG
   if let borderedImage = borderedImageWithText,
      let imageData = borderedImage.pngData() { // Use .jpegData(compressionQuality:) for JPEG
       return UIImage(data: imageData) ?? image
   }
   
   return image
}*/

/*func addBorderToImage(_ image: UIImage, borderColor: UIColor, borderWidth: CGFloat, cornerRadius: CGFloat) -> UIImage {
    let size = CGSize(width: image.size.width + 2 * borderWidth, height: image.size.height + 2 * borderWidth)
    UIGraphicsBeginImageContextWithOptions(size, false, 0)
    
    // Drawing the border
    let rect = CGRect(origin: CGPoint(x: borderWidth, y: borderWidth), size: image.size)
    let borderRect = CGRect(origin: .zero, size: size)
    
    let path = UIBezierPath(roundedRect: borderRect, cornerRadius: cornerRadius)
    borderColor.setFill()
    path.fill()
    
    // Draw the original image inside the border
    let imagePath = UIBezierPath(roundedRect: rect, cornerRadius: cornerRadius - borderWidth)
    imagePath.addClip()
    image.draw(in: rect)
    
    // Get the resulting image
    return image
    guard let borderedImage = UIGraphicsGetImageFromCurrentImageContext() else {
        print("Failed to create bordered image")
        UIGraphicsEndImageContext()
        return image // Fallback to the original image
    }
    
    UIGraphicsEndImageContext()
    
    // Return the processed image directly without converting to data and back
    return borderedImage
}
*/

/*func addBorderToImage(_ image: UIImage, borderColor: UIColor, borderWidth: CGFloat, cornerRadius: CGFloat) -> UIImage {
    let size = CGSize(width: image.size.width + 2 * borderWidth, height: image.size.height + 2 * borderWidth)
    UIGraphicsBeginImageContextWithOptions(size, false, 0)
    
    // Drawing the border
    let rect = CGRect(origin: CGPoint(x: borderWidth, y: borderWidth), size: image.size)
    let borderRect = CGRect(origin: .zero, size: size)
    
    let path = UIBezierPath(roundedRect: borderRect, cornerRadius: cornerRadius)
    borderColor.setFill()
    path.fill()
    
    // Draw the original image inside the border
    let imagePath = UIBezierPath(roundedRect: rect, cornerRadius: cornerRadius - borderWidth)
    imagePath.addClip()
    image.draw(in: rect)
    
    // Add "Papalote MTY" text in white
    let text = "Papalote MTY"
    let textAttributes: [NSAttributedString.Key: Any] = [
        .font: UIFont.boldSystemFont(ofSize: 24),
        .foregroundColor: UIColor.white
    ]
    
    let textSize = text.size(withAttributes: textAttributes)
    let textRect = CGRect(
        x: (size.width - textSize.width) / 2,
        y: size.height - textSize.height - 20,
        width: textSize.width,
        height: textSize.height
    )
    
    text.draw(in: textRect, withAttributes: textAttributes)
    
    // Get the resulting image
    guard let borderedImage = UIGraphicsGetImageFromCurrentImageContext() else {
        print("Failed to create bordered image")
        UIGraphicsEndImageContext()
        return image // Fallback to the original image
    }
    
    UIGraphicsEndImageContext()
    
    return borderedImage
}*/


/*func addBorderToImage(_ image: UIImage, borderColor: UIColor, borderWidth: CGFloat, cornerRadius: CGFloat) -> UIImage {
    let size = CGSize(width: image.size.width + 2 * borderWidth, height: image.size.height + 2 * borderWidth)
    
    // Use UIGraphicsImageRenderer for better modern approach
    let renderer = UIGraphicsImageRenderer(size: size)
    
    let borderedImage = renderer.image { context in
        // Drawing the border
        let borderRect = CGRect(origin: .zero, size: size)
        let path = UIBezierPath(roundedRect: borderRect, cornerRadius: cornerRadius)
        borderColor.setFill()
        path.fill()
        
        // Draw the original image inside the border
        let rect = CGRect(origin: CGPoint(x: borderWidth, y: borderWidth), size: image.size)
        let imagePath = UIBezierPath(roundedRect: rect, cornerRadius: cornerRadius - borderWidth)
        context.cgContext.addPath(imagePath.cgPath)
        context.cgContext.clip()
        image.draw(in: rect)
        
        // Add "Papalote MTY" text in white
        /*let text = "Papalote MTY"
        let textAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.boldSystemFont(ofSize: 24),
            .foregroundColor: UIColor.white
        ]
        
        let textSize = text.size(withAttributes: textAttributes)
        let textRect = CGRect(
            x: (size.width - textSize.width) / 2,
            y: size.height - textSize.height - 20,
            width: textSize.width,
            height: textSize.height
        )
        
        text.draw(in: textRect, withAttributes: textAttributes)*/
    }
    
    return borderedImage
}*/

/*func addBorderToImage(_ photo: UIImage, zonaColor: Color, borderWidth: CGFloat = 20, cornerRadius: CGFloat = 20) -> UIImage {
    let borderColor = UIColor(zonaColor)
    let size = CGSize(
        width: photo.size.width + 2 * borderWidth,
        height: photo.size.height + 2 * borderWidth
    )
    
    let renderer = UIGraphicsImageRenderer(size: size)
    
    let borderedImage = renderer.image { context in
        // Drawing the border
        let borderRect = CGRect(origin: .zero, size: size)
        let path = UIBezierPath(roundedRect: borderRect, cornerRadius: cornerRadius)
        borderColor.setFill()
        path.fill()
        
        // Draw the original image inside the border
        let rect = CGRect(origin: CGPoint(x: borderWidth, y: borderWidth), size: photo.size)
        let imagePath = UIBezierPath(roundedRect: rect, cornerRadius: cornerRadius - borderWidth)
        context.cgContext.addPath(imagePath.cgPath)
        context.cgContext.clip()
        photo.draw(in: rect)
    }
    
    return borderedImage
}*/


/*func addBorderToImage(_ photo: UIImage, zonaColor: Color, borderWidth: CGFloat = 150, cornerRadius: CGFloat = 150) -> UIImage {
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
    
    // Draw border
    let borderRect = CGRect(origin: .zero, size: size)
    context.setFillColor(borderColor.cgColor)
    let borderPath = CGPath(roundedRect: borderRect, cornerWidth: cornerRadius, cornerHeight: cornerRadius, transform: nil)
    context.addPath(borderPath)
    context.fillPath()
    
    // Draw image
    let imageRect = CGRect(origin: CGPoint(x: borderWidth, y: borderWidth), size: scaledImage.size)
    let imagePath = CGPath(roundedRect: imageRect, cornerWidth: cornerRadius - borderWidth, cornerHeight: cornerRadius - borderWidth, transform: nil)
    context.addPath(imagePath)
    context.clip()
    
    scaledImage.draw(in: imageRect)
    
    // Get final image
    let finalImage = UIGraphicsGetImageFromCurrentImageContext() ?? scaledImage
    UIGraphicsEndImageContext()
    
    return finalImage
}*/

// squared border

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
    
    // Draw border as a rectangle (no rounded corners)
    let borderRect = CGRect(origin: .zero, size: size)
    context.setFillColor(borderColor.cgColor)
    context.fill(borderRect) // Simple rectangle fill
    
    // Draw image inside the border
    let imageRect = CGRect(origin: CGPoint(x: borderWidth, y: borderWidth), size: scaledImage.size)
    context.addRect(imageRect) // Rectangle clipping path
    context.clip()
    
    scaledImage.draw(in: imageRect)
    
    // Get final image
    let finalImage = UIGraphicsGetImageFromCurrentImageContext() ?? scaledImage
    UIGraphicsEndImageContext()
    
    return finalImage
}

