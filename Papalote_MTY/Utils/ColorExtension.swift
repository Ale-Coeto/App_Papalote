//
//  ColorExtension.swift
//  Papalote_MTY
//
//  Created by Alejandra Coeto on 15/10/24.
//

import Foundation
import SwiftUI

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        
        let a, r, g, b: UInt64
        switch hex.count {
        case 6: // RGB (no alpha)
            (a, r, g, b) = (255, (int >> 16) & 0xFF, (int >> 8) & 0xFF, int & 0xFF)
        case 8: // ARGB (with alpha)
            (a, r, g, b) = ((int >> 24) & 0xFF, (int >> 16) & 0xFF, (int >> 8) & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0) // Default to black if format is incorrect
        }
        
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
    
    struct AppColors {
        static let VerdePapalote = Color(hex: "#8DE049")
        static let AzulPapalote = Color(hex: "#36B4FE")
        static let FondoAzulClaro = Color(hex: "#F4FAFE")
        static let pertenezco = Color(hex: "#C4D600")
        static let comunico = Color(hex: "#006BA6")
        static let comprendo = Color(hex: "#84329B")
        static let soy = Color(hex: "#D50032")
        static let expreso = Color(hex: "#FF8200")
        static let pequeños = Color(hex: "#009CA6")
    }
}



