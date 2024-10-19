//
//  Visita.swift
//  Papalote_MTY
//
//  Created by Rodrigo Garcia on 17/10/24.
//

import Foundation
import SwiftData

@Model
class Visita: Identifiable {
    var id: Int
    var date: Date
    var orden: String
    
    // Variable Calculada
    var expired: Bool {
        return Date().timeIntervalSince(date) > 24 * 60 * 60
    }
    
    init(id: Int, date: Date, orden: String) {
        self.id = id
        self.date = date
        self.orden = orden
    }
}
