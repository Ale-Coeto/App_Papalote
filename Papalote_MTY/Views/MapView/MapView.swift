//
//  MapView.swift
//  Papalote_MTY
//
//  Created by Alejandra Coeto on 21/10/24.
//

import SwiftUI

struct MapView: View {
    @StateObject var mapViewModel = MapViewModel()
    @StateObject var locationManager = LocationManager()
    let visita: Visita
    
    var body: some View {
        HomeLayoutView(title: "Mapa")
            .overlay(
                VStack {
                    ZStack {
                        MapContainerView(visita: visita, mapViewModel: mapViewModel)
                        
                        //Header
                        MapHeaderView(mapViewModel: mapViewModel)
                                                
                    }
                    
                    // Footer
                    MapFooterView(mapViewModel: mapViewModel)
                    
//                    Text("Latitude: \(String(describing: locationManager.latitude)),  \(String(describing: locationManager.longitude))")
                    
                }
                    .padding(.top, 34)
                    
            )
    }
    
    
}


#Preview {
    MapView(visita: Visita(id: 1, date: Date(), orden: "Pertenezco Comunico Comprendo Soy Expreso Pequeño"))
        .modelContainer(for: [Zona.self, InsigniaObtenida.self, Insignia.self, Evento.self, Visita.self, Foto.self, Exhibicion.self, FetchedDate.self, Pin.self], inMemory: true)
}
