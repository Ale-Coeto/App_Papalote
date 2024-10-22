//
//  BadgeView.swift
//  Reto
//
//  Created by Oscar Zhao Xu on 17/10/24.
//

import SwiftUI

struct ExhibitionView: View {
    @State var exhibicion: Exhibicion
    
    var body: some View {
        VStack(spacing: 20) {
            Text(exhibicion.nombre)
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top, 20)
            
            AsyncImage(url: URL(string: exhibicion.imagen)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200)
                    .padding()
            } placeholder: {
                ProgressView()
                    .frame(width: 200, height: 200)
            }
            
            Text(exhibicion.descripcion)
                .font(.body)
                .multilineTextAlignment(.center) 
                .padding(.horizontal, 30)
                .padding(.vertical, 10)
                .cornerRadius(12)
            
            Button {
                exhibicion.completado.toggle()
            } label: {
                Text("Completar")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.horizontal, 40)
                    .padding(.vertical, 15)
                    .background(exhibicion.completado ? Color.green : Color.gray)
                    .cornerRadius(20)
                    .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
            }
            .padding(.bottom, 20)
        }
        .padding()
        .padding(.horizontal)
    }
}

#Preview {
    @Previewable @State var sampleColor = Color.gray
    let sampleExhibition = Exhibicion(
        id: 1,
        idZona: 1,
        nombre: "Exhibición de Arte Moderno",
        descripcion: "Una colección de obras de arte moderno de varios artistas.",
        completado: true,
        imagen: "https://w7.pngwing.com/pngs/963/1005/png-transparent-modern-art-drawing-visual-arts-design-child-text-cartoon.png",
        isOpen: true,
        location: "Sala de Arte"
    )
    ExhibitionView(exhibicion: sampleExhibition)
}

