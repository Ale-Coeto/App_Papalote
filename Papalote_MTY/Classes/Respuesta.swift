//
//  Pregunta.swift
//  Papalote_MTY
//
//  Created by Oscar Zhao Xu on 23/11/24.
//

import Foundation
import SwiftData

@Model
class Respuesta: Identifiable, Codable {
    var id: Int
    var idZona: Int
    var idPregunta: Int
    var respuesta: String
    
    init(id: Int, idZona: Int, idPregunta: Int, respuesta: String) {
        self.id = id
        self.idZona = idZona
        self.idPregunta = idPregunta
        self.respuesta = respuesta
    }
    
    // Mapear a nombres usados en API externa
    private enum CodingKeys: String, CodingKey {
        case id
        case idZona = "zone_id" // Asumiendo que en la API se llama "zoneId"
        case idPregunta = "question_id" // Asumiendo que en la API se llama "questionId"
        case respuesta = "answer" // Asumiendo que en la API se llama "answer"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        idZona = try container.decode(Int.self, forKey: .idZona)
        idPregunta = try container.decode(Int.self, forKey: .idPregunta)
        respuesta = try container.decode(String.self, forKey: .respuesta)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(idZona, forKey: .idZona)
        try container.encode(idPregunta, forKey: .idPregunta)
        try container.encode(respuesta, forKey: .respuesta)
    }
}
