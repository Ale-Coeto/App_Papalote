//
//  PinUIView.swift
//  Papalote_MTY
//
//  Created by Alejandra Coeto on 24/11/24.
//

import SwiftUI

struct PinUIView: View {
    @ObservedObject var mapViewModel: MapViewModel
    var pin: Pin
    
    var body: some View {
        ZStack (alignment: .center) {
            Text(pin.nombre)
                .background(Color.black.opacity(0.3))
                .offset(y:-(Constants.PIN_SIZE)*mapViewModel.scale)
//                .foregroundStyle(Color(hex: pin.color))
                .foregroundStyle(.white)
                .font(.title3)
                
            
            PointerTriangle(frameSize: Constants.PIN_SIZE*mapViewModel.scale)
                .fill(.white)
                .offset(y: 10*mapViewModel.scale)
                .frame(width: Constants.PIN_SIZE*mapViewModel.scale, height: Constants.PIN_SIZE*mapViewModel.scale)
                .shadow(radius: 3)
            
            Circle()
                .fill(Color(hex: pin.color))
                .overlay {
                    Circle().stroke(Color.white, lineWidth: 2*mapViewModel.scale)
                }
                .shadow(radius: 3)
                .frame(height: (Constants.PIN_SIZE)*mapViewModel.scale)
            
            Image(systemName: pin.icon)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(5*mapViewModel.scale)
                .foregroundStyle(.white)
                .frame(height: Constants.PIN_SIZE*mapViewModel.scale)
            
            
        }
        
    }
}

#Preview {
    VStack {
        PinUIView(mapViewModel: MapViewModel(), pin: Pin(id: 1, idZona: 1, x: 1, y: 1, floor: 1, color: "#339911", icon: "toilet", nombre: "Baños"))
    }
    .frame(width: 200, height: 200)
        .background(.blue)
}
