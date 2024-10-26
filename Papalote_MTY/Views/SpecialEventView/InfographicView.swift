//
//  InfographicView.swift
//  Papalote_MTY
//
//  Created by Rodrigo Garcia on 25/10/24.
//

import SwiftUI

struct InfographicView: View {
    let evento: Evento
    let visita: Visita
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    InfographicView(evento: Evento(id: 1, fechaInicio: Date(), fechaFin: Date(), nombre: "Semana Mundial del espacio", descripcion: "dia del espacio", imagen: "a"), visita: Visita(id: 1, date: Date(), orden: "Pertenezco Comunico Comprendo Soy Expreso Pequeño"))
}
