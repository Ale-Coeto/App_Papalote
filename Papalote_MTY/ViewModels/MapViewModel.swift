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
    @Published var scale: CGFloat = 1
    var zonas: [Zona] = []
    var exhibiciones: [Exhibicion] = []
    var fotos: [Foto] = []
    var insignias: [Insignia] = []
    var visita: Visita = Visita(id: 1, date: Date(), orden: "Pertenezco Comunico Comprendo Soy Expreso Pequeño")
    
    
    var mapImages = [Image("MapaA"), Image("Map")]
    var map1Dimensions: (width: CGFloat, height: CGFloat)? {
        if let uiImage = UIImage(named: "MapaA") {
            let naturalWidth = uiImage.size.width
            let naturalHeight = uiImage.size.height
            return (width: naturalWidth, height: naturalHeight)
        }
        return nil
    }
    
    var map2Dimensions: (width: CGFloat, height: CGFloat)? {
        if let uiImage = UIImage(named: "MapaB") {
            let naturalWidth = uiImage.size.width
            let naturalHeight = uiImage.size.height
            return (width: naturalWidth, height: naturalHeight)
        }
        return nil
    }
    
    var dimensions: [(width: CGFloat, height: CGFloat)?] {
        [map1Dimensions, map2Dimensions]
    }
    
    
    func changeFloor(_ floor: Int) {
        selectedFloor = floor
    }
    
//    func updateDataAsync(zonas: [Zona], exhibiciones: [Exhibicion], fotos: [Foto], visita: Visita?) async {
//            try? await Task.sleep(nanoseconds: 500_000_000) // 0.5 seconds delay
//            self.zonas = zonas
//            self.exhibiciones = exhibiciones
//            self.fotos = fotos
//            t
//        }

    
}

