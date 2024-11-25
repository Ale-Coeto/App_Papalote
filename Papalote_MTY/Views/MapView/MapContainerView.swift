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

//    let mapSize = CGSize(width: 1474, height: 1322)

    
    var body: some View {
        NavigationStack {
                
                ScrollView([.horizontal, .vertical], showsIndicators: false) {
                    ZStack {

                        
                        if let w = mapViewModel.dimensions[mapViewModel.selectedFloor - 1]?.width,
                           let h = mapViewModel.dimensions[mapViewModel.selectedFloor - 1]?.height {
                            mapViewModel.mapImages[mapViewModel.selectedFloor-1]
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: w * mapViewModel.scale, height: h * mapViewModel.scale) // Explicitly set size
                                .gesture(
                                    MagnificationGesture()
                                        .onChanged { value in
                                            mapViewModel.scale = mapViewModel.scale * value // Clamp scale between 0.5 and 3.0
                                            print("Scale: \(mapViewModel.scale)")
                                        }
                                )
                                .background(.blue) // For debugging purposes
                        }
                        
                        
                        
                        
                        
                        if let w = mapViewModel.dimensions[mapViewModel.selectedFloor - 1]?.width,
                           let h = mapViewModel.dimensions[mapViewModel.selectedFloor - 1]?.height {
                            ForEach(pines, id: \.self.id) { pin in
                                // Calculate pin positions based on percentage and scale
                                let x = (pin.x / 100) * w * mapViewModel.scale
                                let y = (pin.y / 100) * h * mapViewModel.scale
                                
                                PinView(
                                    pin: pin,
                                    show: pin.floor == mapViewModel.selectedFloor,
                                    mapViewModel: mapViewModel,
                                    zonas: zonas,
                                    exhibiciones: exhibiciones,
                                    insignias: insignias,
                                    fotos: fotos
                                )
                                .position(x: x, y: y)
                            }
                        } else {
                            Text("Loading dimensions...")
                        }
                    }
                
            }
                .background(Color.gray.opacity(0.3))
        }
        .onAppear {
            Task {
                mapViewModel.zonas = zonas
                mapViewModel.exhibiciones = exhibiciones
                mapViewModel.fotos = fotos
                mapViewModel.visita = visita
                print(pines.count)
            }
        }
    }
    
}

#Preview {
    MapContainerView(visita: Visita(id: 1, date: Date(), orden: "Pertenezco Comunico Comprendo Soy Expreso Pequeño"), mapViewModel: MapViewModel())
        .modelContainer(for: [Zona.self, InsigniaObtenida.self, Insignia.self, Evento.self, Visita.self, Foto.self, Exhibicion.self, Pin.self, FetchedDate.self, Pin.self], inMemory: true)
}
