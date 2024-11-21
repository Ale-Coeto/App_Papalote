//
//  Zona.swift
//  Papalote_MTY
//
//  Created by Alejandra Coeto on 15/10/24.
//

import Foundation
import SwiftData

@Model
class Zona: Identifiable, Codable {
    var id: Int
    var nombre: String
    var descripcion: String
    var color: String
    var logo: String
    
    init(id: Int, nombre: String, descripcion: String, color: String, logo: String) {
        self.id = id
        self.nombre = nombre
        self.descripcion = descripcion
        self.color = color
        self.logo = logo
    }
    
    // Mapear a nombres usados en API externa.
    private enum CodingKeys: String, CodingKey {
            case id
            case nombre = "name"
            case descripcion = "description"
            case color
            case logo
        }
    
    required init(from decoder: Decoder) throws {
           let container = try decoder.container(keyedBy: CodingKeys.self)
           id = try container.decode(Int.self, forKey: .id)
           nombre = try container.decode(String.self, forKey: .nombre)
           descripcion = try container.decode(String.self, forKey: .descripcion)
           color = try container.decode(String.self, forKey: .color)
           logo = try container.decode(String.self, forKey: .logo)
       }
       
       // Custom method for encoding
       func encode(to encoder: Encoder) throws {
           var container = encoder.container(keyedBy: CodingKeys.self)
           try container.encode(id, forKey: .id)
           try container.encode(nombre, forKey: .nombre)
           try container.encode(descripcion, forKey: .descripcion)
           try container.encode(color, forKey: .color)
           try container.encode(logo, forKey: .logo)
       }
}
