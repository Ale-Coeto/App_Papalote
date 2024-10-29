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
    var points = [[CGPoint(x: 300, y: 400),
                   CGPoint(x: 900, y: 600),
                   CGPoint(x: 600, y: 200)],
                  [CGPoint(x: 300, y: 400),
                   CGPoint(x: 900, y: 600),
                   CGPoint(x: 600, y: 200)]]
    
    func changeFloor(_ floor: Int) {
        selectedFloor = floor
    }
    
    
    
    //    var mapImage = Image("Piso1")
    
}

