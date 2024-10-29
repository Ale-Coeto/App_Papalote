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
            NavigationLink {
//                pin.idZona != 0 ? AnyView(ZoneDetailView()) : nil
//                if pin.idZona != 0 {
                    ZoneDetailView()
//                } else {
//                    nil
//                }
            } label: {
                
                ZStack (alignment: .center) {
                    Text(pin.nombre)
                        .offset(y:-(Constants.PIN_SIZE+15)*mapViewModel.scale)
                        .foregroundStyle(Color(hex: pin.color))
                    
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
    PinView(pin: Pin(id: 1, idZona: 1, x: 1, y: 1, floor: 1, color: "#111111", icon: "", nombre: "Baños"), show: true, mapViewModel: MapViewModel(), zonas: [], exhibiciones: [], insignias: [], fotos: [])
}
