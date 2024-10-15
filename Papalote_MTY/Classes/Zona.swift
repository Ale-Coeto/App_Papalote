//
//  Zona.swift
//  Papalote_MTY
//
//  Created by Alejandra Coeto on 15/10/24.
//

import Foundation
class Zona: Codable, Identifiable {
    var id: Int
    var nombre: String
    var descripcion: String
    var color: String
    
    init(id: Int, nombre: String, descripcion: String, color: String) {
        self.id = id
        self.nombre = nombre
        self.descripcion = descripcion
        self.color = color
    }
}
