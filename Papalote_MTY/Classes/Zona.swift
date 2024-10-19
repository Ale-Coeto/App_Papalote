//
//  Zona.swift
//  Papalote_MTY
//
//  Created by Alejandra Coeto on 15/10/24.
//

import Foundation
import SwiftData

@Model
class Zona: Identifiable {
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
}
