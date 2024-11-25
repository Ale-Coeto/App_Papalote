//
//  PinView.swift
//  Papalote_MTY
//
//  Created by Alejandra Coeto on 28/10/24.
//

import SwiftUI


struct PinView: View {
    var pin: Pin
    var show: Bool
    @ObservedObject var mapViewModel: MapViewModel
    var zonas: [Zona]
    var exhibiciones: [Exhibicion]
    var insignias: [Insignia]
    var fotos: [Foto]

    var body: some View {
        
        if show {
            if pin.idZona != nil {
                NavigationLink {
                    ZoneDetailView()
                } label: {
                    PinUIView(mapViewModel: mapViewModel, pin: pin)
                }
            } else {
                PinUIView(mapViewModel: mapViewModel, pin: pin)
            }
        }
    }
    
    
    private func ZoneDetailView() -> some View {
        let filteredZona = zonas.first { $0.id == pin.idZona }
        let defaultZona = Zona(id: 1, nombre: "Zona no encontrada", descripcion: "", color: "", logo: "")
        
        let filteredExhibicion = exhibiciones.filter { $0.idZona == pin.idZona }
        let filteredInsignias = insignias.filter { $0.idZona == pin.idZona }
        let filteredFotos = fotos.filter { $0.idZona == pin.idZona }
        
        return ZoneView(
            zona: filteredZona ?? defaultZona,
            exhibiciones: filteredExhibicion,
            insignias: filteredInsignias,
            fotos: filteredFotos,
            visita: mapViewModel.visita
        )
    }
}

#Preview {
    PinView(pin: Pin(id: 1, idZona: 1, x: 1, y: 1, floor: 1, color: "#339911", icon: "toilet", nombre: "Baños"), show: true, mapViewModel: MapViewModel(), zonas: [], exhibiciones: [], insignias: [], fotos: [])
}
