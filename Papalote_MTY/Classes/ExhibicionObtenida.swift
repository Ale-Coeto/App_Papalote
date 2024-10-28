//
//  ExhibicionObtenida.swift
//  Papalote_MTY
//
//  Created by Rodrigo Garcia on 28/10/24.
//


import Foundation
import SwiftData

@Model
class ExhibicionObtenida {
    var id: Int
    var visitaId: Int
    
    init(id: Int, visitaId: Int) {
        self.id = id
        self.visitaId = visitaId
    }
}
