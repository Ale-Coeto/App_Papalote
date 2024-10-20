//
//  BadgeView.swift
//  Reto
//
//  Created by Oscar Zhao Xu on 17/10/24.
//

import SwiftUI

struct BadgeView: View {
    let insignia: Insignia
    
    var body: some View {
        VStack(spacing: 20) {
            Text(insignia.nombre)
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top, 20)
            
            AsyncImage(url: URL(string: insignia.imagen)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200)
                    .padding()
            } placeholder: {
                ProgressView()
                    .frame(width: 200, height: 200)
            }
            
            Text(insignia.descripcion)
                .font(.body)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 30)
                .padding(.vertical, 10)
                .cornerRadius(12)
            
            Button {
                // Acción para tomar escanear
            } label: {
                Text("Escanear")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.horizontal, 40)
                    .padding(.vertical, 15)
                    .background(Color.green)
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
    let sampleInsignia = Insignia(
        id: 1,
        idZona: 1,
        idEvento: -1,
        nombre: "SuperPoderosa",
        imagen: "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png",
        descripcion: "no_descripcion",
        idNFC: 1
    )
    BadgeView(insignia: sampleInsignia)
}
