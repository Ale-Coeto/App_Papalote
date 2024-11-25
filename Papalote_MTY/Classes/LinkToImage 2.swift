//
//  LinkToImage 2.swift
//  Papalote_MTY
//
//  Created by Rodrigo Garcia on 25/11/24.
//


//
//  linkToImage.swift
//  Papalote_MTY
//
//  Created by Rodrigo Garcia on 25/11/24.
//

import Foundation
import SwiftData
@Model
class LinkToImage: Identifiable {
    var link: String
    var imagen: Data?
    init(link: String, imagen: Data? = nil) {
        self.link = link
        self.imagen = imagen
    }
}