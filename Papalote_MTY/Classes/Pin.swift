//
//  Pin.swift
//  Papalote_MTY
//
//  Created by Alejandra Coeto on 29/10/24.
//

import Foundation
import SwiftData

@Model
class Pin: Identifiable {
    var id: Int
    var idZona: Int
    var x: CGFloat
    var y: CGFloat
    var floor: Int
    var color: String
    var icon: String
    var nombre: String
    
    init(id: Int, idZona: Int, x: CGFloat, y: CGFloat, floor: Int, color: String, icon: String, nombre: String) {
        self.id = id
        self.idZona = idZona
        self.x = x
        self.y = y
        self.floor = floor
        self.color = color
        self.icon = icon
        self.nombre = nombre
    }
}
