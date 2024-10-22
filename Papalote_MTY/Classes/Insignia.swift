//
//  Insignia.swift
//  Papalote_MTY
//
//  Created by Rodrigo Garcia on 18/10/24.
//


//
//  Insignia.swift
//  Papalote_MTY
//
//  Created by Rodrigo Garcia on 17/10/24.
//

import Foundation
import SwiftData

@Model
class Insignia: Identifiable{
    var id: Int
    var idZona: Int
    var idEvento: Int
    var nombre: String
    var imagen: String
    var descripcion: String
    var completado: Bool
    var idNFC: Int
    
    init(id: Int, idZona: Int, idEvento: Int, nombre: String, imagen: String, descripcion: String, completado: Bool, idNFC: Int) {
        self.id = id
        self.idZona = idZona
        self.idEvento = idEvento
        self.nombre = nombre
        self.imagen = imagen
        self.descripcion = descripcion
        self.completado = completado
        self.idNFC = idNFC
    }
}
