//
//  Pin.swift
//  Papalote_MTY
//
//  Created by Alejandra Coeto on 29/10/24.
//

import Foundation
import SwiftData

@Model
class Pin: Identifiable {
    var id: Int
    var idZona: Int
    var x: CGFloat
    var y: CGFloat
    
    init(id: Int, idZona: Int, x: CGFloat, y: CGFloat) {
        self.id = id
        self.idZona = idZona
        self.x = x
        self.y = y
    }
}
