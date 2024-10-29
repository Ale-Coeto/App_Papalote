//
//  MapContainerView.swift
//  Papalote_MTY
//
//  Created by Alejandra Coeto on 24/10/24.
//

import SwiftUI
import SwiftData

struct MapContainerView: View {
    @Environment(\.modelContext) private var context
    @Query private var zonas: [Zona]
    @Query private var pines: [Pin]
    @Query private var exhibiciones: [Exhibicion]
    @Query private var insignias: [Insignia]
    @Query private var fotos: [Foto]
    let visita: Visita
    
    @ObservedObject var mapViewModel: MapViewModel

    let mapSize = CGSize(width: 1200, height: 800)

    
    var body: some View {
        NavigationStack {
                
                ScrollView([.horizontal, .vertical], showsIndicators: false) {
                    ZStack {
                        mapViewModel.mapImages[mapViewModel.selectedFloor-1]
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: mapSize.width * mapViewModel.scale, height: mapSize.height * mapViewModel.scale)
                            .gesture(
                                MagnificationGesture()
                                    .onChanged { value in
                                        mapViewModel.scale = value
                                    }
                            )

                        // Add pins (fixed icons) at specific positions on the map
                        ForEach(pines, id: \.self.id) { pin in
                            let x = pin.x * mapViewModel.scale
                            let y = pin.y * mapViewModel.scale
                            
//                            NavigationLink {
//                                
//                                ZoneDetailView(for: pin)
//                            } label: {
                            PinView(pin: pin, show: pin.floor == mapViewModel.selectedFloor, mapViewModel: mapViewModel)
                                    .position(x:x, y:y)
//                                    .frame(width: 30, height: 30)
//                                    .background(.red)
//                            }
                        }
                    }
//                }
                
            }
                .background(Color.gray.opacity(0.3))
        }
        .onAppear {
            mapViewModel.zonas = zonas
            mapViewModel.exhibiciones = exhibiciones
            mapViewModel.fotos = fotos
            mapViewModel.visita = visita
        }
    }
    
//    private func ZoneDetailView(for pin: Pin) -> some View {
//            let filteredZona = zonas.first { $0.id == pin.idZona }
//        let defaultZona = Zona(id: 1, nombre: "", descripcion: "", color: "", logo: "Map")
//            let filteredExhibicion = exhibiciones.filter { $0.idZona == pin.idZona }
//            let filteredInsignias = insignias.filter { $0.idZona == pin.idZona }
//            let filteredFotos = fotos.filter { $0.idZona == pin.idZona }
//
//            return ZoneView(
//                zona: filteredZona ?? defaultZona,
//                exhibiciones: filteredExhibicion,
//                insignias: filteredInsignias,
//                fotos: filteredFotos,
//                visita: visita
//            )
//        }
}

#Preview {
    MapContainerView(visita: Visita(id: 1, date: Date(), orden: "Pertenezco Comunico Comprendo Soy Expreso Pequeño"), mapViewModel: MapViewModel())
        .modelContainer(for: [Zona.self, InsigniaObtenida.self, Insignia.self, Evento.self, Visita.self, Foto.self, Exhibicion.self, Pin.self], inMemory: true)
}
