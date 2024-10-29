//
//  SpecialEventView.swift
//  Papalote_MTY
//
//  Created by Rodrigo Garcia on 25/10/24.
//

import SwiftUI

struct SpecialEventView: View {
    let evento: Evento
    let visita: Visita
    var body: some View {
        HomeLayoutView(title: evento.nombre).overlay(
        TabView {
            
            // First tab showing SpecialEventBadgesView
            InfographicView(evento: evento, visita: visita)
                .tabItem {
                    Text("Badges")
                }
                .padding(.top, 22)
            // Second tab showing InfographicView
            SpecialEventBadgesView(evento: evento, visita: visita)
                .tabItem {
                    Text("Infographic")
                }
                .padding(.top, 35)
            
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always)) // Enables swiping
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always)) // Adds dots for page indicators

        )
    }
    
}

#Preview {
    SpecialEventView(evento: Evento(id: 1, fechaInicio: Date(), fechaFin: Date(), nombre: "Semana Mundial del espacio", descripcion: "dia del espacio", imagen: "a"), visita: Visita(id: 1, date: Date(), orden: "Pertenezco Comunico Comprendo Soy Expreso Pequeño"))
}
