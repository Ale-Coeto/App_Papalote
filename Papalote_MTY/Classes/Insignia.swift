//
//  Insignia.swift
//  Papalote_MTY
//
//  Created by Rodrigo Garcia on 18/10/24.
//

import Foundation
import SwiftData

@Model
class Insignia: Identifiable, Codable{
    var id: Int
    var idZona: Int
    var idEvento: Int
    var nombre: String
    var imagen: String
    var descripcion: String
    var completado: Bool
    var idNFC: String
    
    init(id: Int, idZona: Int, idEvento: Int, nombre: String, imagen: String, descripcion: String, completado: Bool, idNFC: String) {
        self.id = id
        self.idZona = idZona
        self.idEvento = idEvento
        self.nombre = nombre
        self.imagen = imagen
        self.descripcion = descripcion
        self.completado = completado
        self.idNFC = idNFC
    }
    
    // Mapear a nombres usados en API externa.
    private enum CodingKeys: String, CodingKey {
        case id
        case idZona = "zone_id"
        case idEvento = "special_event_id"
        case nombre = "name"
        case imagen = "logo"
        case descripcion = "description"
        case idNFC = "nfc_code"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        idZona = try container.decode(Int.self, forKey: .idZona)
        idEvento = try container.decodeIfPresent(Int.self, forKey: .idEvento) ?? -1
        nombre = try container.decode(String.self, forKey: .nombre)
        imagen = try container.decode(String.self, forKey: .imagen)
        descripcion = try container.decode(String.self, forKey: .descripcion)
        idNFC = try container.decode(String.self, forKey: .idNFC)
        completado = false
    }
    
    // Custom method for encoding
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(idZona, forKey: .idZona)
        try container.encode(idEvento, forKey: .idEvento)
        try container.encode(nombre, forKey: .nombre)
        try container.encode(imagen, forKey: .imagen)
        try container.encode(descripcion, forKey: .descripcion)
        try container.encode(idNFC, forKey: .idNFC)
    }
}
