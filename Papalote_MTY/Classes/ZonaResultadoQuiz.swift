//
//  ZonaResultadoQuiz.swift
//  Papalote_MTY
//
//  Created by José Guerrero  on 26/10/24.
//

import Foundation
import SwiftUI

class ZonaResultadoQuiz: Identifiable {
    var id: Int
    var nombre: String
    var descripcion: String
    var color: Color
    var logo: UIImage
    
    init(id: Int, nombre: String, descripcion: String, color: Color, logo: UIImage) {
        self.id = id
        self.nombre = nombre
        self.descripcion = descripcion
        self.color = Color(color)
        self.logo = UIImage()
    }
}
