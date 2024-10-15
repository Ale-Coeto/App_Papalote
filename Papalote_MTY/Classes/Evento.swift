//
//  Evento.swift
//  Papalote_MTY
//
//  Created by Alejandra Coeto on 15/10/24.
//

import Foundation

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
    
}
