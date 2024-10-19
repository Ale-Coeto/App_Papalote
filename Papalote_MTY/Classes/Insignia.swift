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
    var fotoUrl: String
    var zonaId: Int
    var eventoId: Int
    var descripcion: String
    var nfcId: Int
    
    init(id: Int, fotoUrl: String, zonaId: Int, eventoId: Int, descripcion: String, nfcId: Int) {
        self.id = id
        self.fotoUrl = fotoUrl
        self.zonaId = zonaId
        self.eventoId = eventoId
        self.descripcion = descripcion
        self.nfcId = nfcId
    }
}
