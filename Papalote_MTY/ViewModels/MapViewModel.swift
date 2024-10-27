//
//  MapViewModel.swift
//  Papalote_MTY
//
//  Created by Alejandra Coeto on 21/10/24.
//

import Foundation
import SwiftUI

class MapViewModel: ObservableObject {
    @Published var selectedFloor: Int = 1
    @Published var scale: CGFloat = 0.6
    
    var mapImages = [Image("Map"), Image("LogoSoy")]
    
    func changeFloor(_ floor: Int) {
        selectedFloor = floor
    }
    
//    var mapImage = Image("Piso1")
    
}

