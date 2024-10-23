//
//  Foto.swift
//  Papalote_MTY
//
//  Created by Oscar Zhao Xu on 19/10/24.
//

import Foundation
import SwiftData

@Model
class Foto: Identifiable{
    var id: Int
    var idZona: Int
    var idVisita: Int
    var imagen: String
    var completado: Bool
    
    init(id: Int, idZona: Int, idVisita: Int, imagen: String, completado: Bool) {
        self.id = id
        self.idZona = idZona
        self.idVisita = idVisita
        self.imagen = imagen
        self.completado = completado
    }
}
