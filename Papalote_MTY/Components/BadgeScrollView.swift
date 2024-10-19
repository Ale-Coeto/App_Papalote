//
//  BadgeScrollView.swift
//  Papalote_MTY
//
//  Created by Rodrigo Garcia on 19/10/24.
//

import SwiftUI

struct BadgeScrollView: View {
    var sectionName: String
    var insignias: [Insignia] // Now receive a list of Insignia objects
    @Binding var showSheet: Bool

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            VStack(alignment: .leading) {
                Text(sectionName)
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(.gray)
                    .padding([.top, .leading, .trailing])
                
                ScrollView(.horizontal, showsIndicators: true) {
                    HStack(spacing: 15) {
                        ForEach(insignias, id: \.self.id) { insignia in
                            Button(action: {
                                showSheet = true
                            }) {
                                // Async image para url
                                AsyncImage(url: URL(string: insignia.fotoUrl)) { phase in
                                    if let image = phase.image {
                                        image
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 50, height: 50)
                                            .background(Color.white)
                                            .clipShape(Circle())
                                            .overlay(
                                                Circle().stroke(Color.gray, lineWidth: 1)
                                            )
                                            .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
                                            .padding(8)
                                    } else {
                                        Circle()
                                            .fill(Color.gray.opacity(0.5))
                                            .frame(width: 50, height: 50)
                                    }
                                }
                            }
                            .sheet(isPresented: $showSheet) {
                                Text("Sheet Content")
                                    .font(.title)
                                    .padding()
                            }
                        }
                    }
                    .padding(.horizontal)
                }
                .frame(height: 80)
            }
            .background(Color.white)
            .cornerRadius(12)
            .shadow(color: Color.black.opacity(0.1), radius: 8, x: 0, y: 4)
        }
        .padding(.horizontal)
        .padding(.bottom, 10)
    }
}

#Preview {
    BadgeScrollView(
        sectionName: "Sample Section",
        insignias: [
            Insignia(id: 1, nombre: "Eco Guerrero", fotoUrl: "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png", zonaId: 1, eventoId: 1, descripcion: "Insignia por promover acciones ecológicas", nfcId: 1),
            Insignia(id: 2, nombre: "Protector del Bosque", fotoUrl: "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png", zonaId: 1, eventoId: 1, descripcion: "Insignia por proteger los recursos naturales", nfcId: 1),
            Insignia(id: 3, nombre: "Amigo de la Tierra", fotoUrl: "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png", zonaId: 1, eventoId: 1, descripcion: "Insignia por cuidar la biodiversidad", nfcId: 1),
            Insignia(id: 4, nombre: "Héroe Sustentable", fotoUrl: "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png", zonaId: 1, eventoId: 1, descripcion: "Insignia por promover la sustentabilidad", nfcId: 1)
        ],
        showSheet: .constant(false)
    )
}
