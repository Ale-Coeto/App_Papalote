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
    @Published var scale: CGFloat = 0.7
    var zonas: [Zona] = []
    var exhibiciones: [Exhibicion] = []
    var fotos: [Foto] = []
    var insignias: [Insignia] = []
    var visita: Visita = Visita(id: 1, date: Date(), orden: "Pertenezco Comunico Comprendo Soy Expreso Pequeño")
    
    
    var mapImages = [Image("MapaA"), Image("Map")]
    
    func changeFloor(_ floor: Int) {
        selectedFloor = floor
    }

    
}

