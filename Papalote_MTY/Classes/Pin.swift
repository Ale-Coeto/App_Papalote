//
//  Pin.swift
//  Papalote_MTY
//
//  Created by Alejandra Coeto on 29/10/24.
//

import Foundation
import SwiftData

@Model
class Pin: Identifiable, Codable {
    var id: Int
    var idZona: Int?
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
    
    // Mapear a nombres usados en API externa.
    private enum CodingKeys: String, CodingKey {
        case id
        case idZona = "zone_id"
        case nombre = "name"
        case icon = "icon"
        case color = "color"
        case floor = "piso"
        case x = "x"
        case y = "y"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        nombre = try container.decode(String.self, forKey: .nombre)
        icon = try container.decode(String.self, forKey: .icon)
        color = try container.decode(String.self, forKey: .color)
        floor = try container.decode(Int.self, forKey: .floor)
        x = CGFloat(try container.decode(Int.self, forKey: .x))
        y = CGFloat(try container.decode(Int.self, forKey: .y))
        idZona = try container.decodeIfPresent(Int.self, forKey: .idZona)
        
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(idZona, forKey: .idZona)
        try container.encode(nombre, forKey: .nombre)
        try container.encode(icon, forKey: .icon)
        try container.encode(color, forKey: .color)
        try container.encode(floor, forKey: .floor)
        try container.encode(x, forKey: .x)
        try container.encode(y, forKey: .y)
    }
}

