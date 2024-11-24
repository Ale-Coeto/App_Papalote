//
//  Exhibicion.swift
//  Papalote_MTY
//
//  Created by Oscar Zhao Xu on 19/10/24.
//

import Foundation
import SwiftUI
import SwiftData

@Model
class Exhibicion: Identifiable, Codable{
    var id: Int
    var idZona: Int
    var nombre: String
    var descripcion: String
    var completado: Bool
    var imagen: String
    var isOpen: Bool
    var location: String
    
    
    init(id: Int, idZona: Int, nombre: String, descripcion: String, completado: Bool, imagen: String, isOpen: Bool, location: String)  {
        self.id = id
        self.idZona = idZona
        self.nombre = nombre
        self.descripcion = descripcion
        self.completado = completado
        self.imagen = imagen
        self.isOpen = isOpen
        self.location = location
    }
    
    // Mapear a nombres usados en API externa.
    private enum CodingKeys: String, CodingKey {
        case id
        case idZona = "zone_id"
        case nombre = "name"
        case descripcion = "description"
        case completado = "completed"
        case imagen = "image"
        case isOpen = "is_open"
        case location
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        idZona = try container.decode(Int.self, forKey: .idZona)
        nombre = try container.decode(String.self, forKey: .nombre)
        descripcion = try container.decode(String.self, forKey: .descripcion)
        completado = false
        imagen = try container.decode(String.self, forKey: .imagen)
        isOpen = try container.decode(Bool.self, forKey: .isOpen)
        location = ""
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(idZona, forKey: .idZona)
        try container.encode(nombre, forKey: .nombre)
        try container.encode(descripcion, forKey: .descripcion)
        try container.encode(completado, forKey: .completado)
        try container.encode(imagen, forKey: .imagen)
        try container.encode(isOpen, forKey: .isOpen)
        try container.encode(location, forKey: .location)
    }
    
}
