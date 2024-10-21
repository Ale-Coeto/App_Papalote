//
//  Exhibicion.swift
//  Papalote_MTY
//
//  Created by Oscar Zhao Xu on 19/10/24.
//

import Foundation
import SwiftData

@Model
class Exhibicion: Identifiable{
    var id: Int
    var idZona: Int
    var nombre: String
    var descripcion: String
    var imagen: String
    var isOpen: Bool
    var location: String
    
    
    init(id: Int, idZona: Int, nombre: String, descripcion: String, imagen: String, isOpen: Bool, location: String)  {
        self.id = id
        self.idZona = idZona
        self.nombre = nombre
        self.descripcion = descripcion
        self.imagen = imagen
        self.isOpen = isOpen
        self.location = location
    }
    
}
