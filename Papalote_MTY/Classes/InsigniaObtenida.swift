//
//  InsigniaObtenida.swift
//  Papalote_MTY
//
//  Created by Rodrigo Garcia on 18/10/24.
//


//
//  InsigniaObtenida.swift
//  Papalote_MTY
//
//  Created by Rodrigo Garcia on 17/10/24.
//

import Foundation
import SwiftData

@Model
class InsigniaObtenida {
    var id: Int
    var visitaId: Int
    
    init(id: Int, visitaId: Int) {
        self.id = id
        self.visitaId = visitaId
    }
}
