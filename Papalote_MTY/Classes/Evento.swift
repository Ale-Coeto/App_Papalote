//
//  Evento.swift
//  Papalote_MTY
//
//  Created by Alejandra Coeto on 15/10/24.
//

import Foundation
import SwiftData

@Model
class Evento: Identifiable, Codable {
    var id: Int
    var fechaInicio: Date
    var fechaFin: Date
    var nombre: String
    var descripcion: String
    var imagen: String
    
    init(id: Int, fechaInicio: Date, fechaFin: Date, nombre: String, descripcion: String, imagen: String) {
        self.id = id
        self.fechaInicio = fechaInicio
        self.fechaFin = fechaFin
        self.nombre = nombre
        self.descripcion = descripcion
        self.imagen = imagen
    }
    
    // Mapear a nombres usados en API externa.
    private enum CodingKeys: String, CodingKey {
        case id
        case fechaInicio = "start_date"
        case fechaFin = "end_date"
        case nombre = "name"
        case descripcion = "description"
        case imagen = "image"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        fechaInicio = try container.decode(Date.self, forKey: .fechaInicio)
        fechaFin = try container.decode(Date.self, forKey: .fechaFin)
        nombre = try container.decode(String.self, forKey: .nombre)
        
        descripcion = try container.decode(String.self, forKey: .descripcion)
        imagen = try container.decode(String.self, forKey: .imagen)
        
        
    }
    
    // Custom method for encoding
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(fechaInicio, forKey: .fechaInicio)
        try container.encode(fechaFin, forKey: .fechaFin)
        try container.encode(nombre, forKey: .nombre)
        try container.encode(descripcion, forKey: .descripcion)
        try container.encode(imagen, forKey: .imagen)
    }
    
}
