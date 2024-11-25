//
//  Pregunta.swift
//  Papalote_MTY
//
//  Created by Oscar Zhao Xu on 23/11/24.
//

import Foundation
import SwiftData

@Model
class Pregunta: Identifiable, Codable {
    var id: Int
    var pregunta: String
    
    init(id: Int, pregunta: String) {
        self.id = id
        self.pregunta = pregunta
    }
    
    // Mapear a nombres usados en API externa
    private enum CodingKeys: String, CodingKey {
        case id
        case pregunta = "question"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        pregunta = try container.decode(String.self, forKey: .pregunta)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(pregunta, forKey: .pregunta)
    }
}
