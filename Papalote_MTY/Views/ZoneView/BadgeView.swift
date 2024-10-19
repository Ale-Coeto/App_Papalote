//
//  BadgeView.swift
//  Reto
//
//  Created by Oscar Zhao Xu on 17/10/24.
//

import SwiftUI

struct BadgeView: View {
    @State var nombre = "Insignia"
    @State var descripcion = """
    Para conseguir esta insigina tendras que ir a la zona donde esta el arenero y encontrar una caja donde se encontrara una pieza que destaca, esa pieza será de forma de un  contenedor y dentro de ella estará el tesoro a encontrar.
 """
    
    var body: some View {
        VStack(spacing: 20) {
            Text(nombre)
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top, 20)
            
            Image(systemName: "mic.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200)
                .padding()
            
            Text(descripcion)
                .font(.body)
                .multilineTextAlignment(.center) // Centra el texto
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
    BadgeView()
}
