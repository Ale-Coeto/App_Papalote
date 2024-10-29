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

    
    var body: some View {
        
        if show {
            NavigationLink {
                ZoneDetailView()
            } label: {
                ZStack (alignment: .center) {
                    
                    PointerTriangle(frameSize: Constants.PIN_SIZE*mapViewModel.scale)
                        .fill(.white)
                        .offset(y: 26*mapViewModel.scale)
                        .frame(width: Constants.PIN_SIZE*mapViewModel.scale, height: Constants.PIN_SIZE*mapViewModel.scale)
                        .shadow(radius: 3)
                    
                    Circle()
                        .fill(Color(hex: pin.color))
                        .overlay {
                            Circle().stroke(Color.white, lineWidth: 3*mapViewModel.scale)
                        }
                        .shadow(radius: 3)
                        .frame(height: (Constants.PIN_SIZE+15)*mapViewModel.scale)
                    
                    Image(systemName: pin.icon)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundStyle(.white)
                        .frame(height: Constants.PIN_SIZE*mapViewModel.scale)

                }
            }
        }
    }
    
    private func ZoneDetailView() -> some View {
        print(pin.idZona)
        print(mapViewModel.zonas.count)
        let filteredZona = mapViewModel.zonas.first { $0.id == pin.idZona }
        let defaultZona = Zona(id: 1, nombre: "L", descripcion: "", color: "", logo: "Map")
        let filteredExhibicion = mapViewModel.exhibiciones.filter { $0.idZona == pin.idZona }
        let filteredInsignias = mapViewModel.insignias.filter { $0.idZona == pin.idZona }
        let filteredFotos = mapViewModel.fotos.filter { $0.idZona == pin.idZona }
        print(filteredZona?.nombre ?? "NADA")
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
    PinView(pin: Pin(id: 1, idZona: 1, x: 1, y: 1, floor: 1, color: "#111111", icon: ""), show: true, mapViewModel: MapViewModel())
}
