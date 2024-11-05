//
//  BadgeView.swift
//  Reto
//
//  Created by Oscar Zhao Xu on 17/10/24.
//

import SwiftUI
import SwiftData

struct BadgeView: View {
    let insignia: Insignia
    let visita: Visita
    var zonaColor : Color 
    
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) var dismiss
    @Query private var insigniasObtenidas: [InsigniaObtenida]
    
    var body: some View {
        VStack(spacing: 20) {
            Text(insignia.nombre)
                .font(Font.custom("VagRoundedBold", size: 40))
                .multilineTextAlignment(.center)
                .fontWeight(.bold)
                .padding(.top, 20)
    
            Divider()
                .frame(minHeight: 5)
                .background(zonaColor)
            
            AsyncImage(url: URL(string: insignia.imagen)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 280, height: 280)
                    .padding()
            } placeholder: {
                ProgressView()
                    .frame(width: 280, height: 280)
            }
            
            Text(insignia.descripcion)
                .font(Font.custom("VagRounded-Light", size: 20))
                .multilineTextAlignment(.center)
                .padding(.horizontal, 30)
                .padding(.vertical, 10)
                .cornerRadius(12)
            
            Button {
                // Check if the insignia has already been obtained for the current visita
                if !insigniasObtenidas.contains(where: { $0.id == insignia.id && $0.visitaId == visita.id }) {
                    // Create a new InsigniaObtenida instance
                    let newInsigniaObtenida = InsigniaObtenida(id: insignia.id, visitaId: visita.id)
                    
                    // Add it to the context
                    context.insert(newInsigniaObtenida)
                    
                    // Save the context (if applicable in your environment)
                    do {
                        try context.save()
                        // Dismiss the BadgeView after saving
                        dismiss() // Dismisses the view
                    } catch {
                        print("Error saving new InsigniaObtenida: \(error)")
                    }
                } else {
                    // Dismiss even if insignia is already obtained
                    dismiss() // Dismisses the view
                }
            } label: {
                Text("Completar")
                    .font(Font.custom("VagRoundedBold", size: 24))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.horizontal, 40)
                    .padding(.vertical, 15)
                    .background(insigniasObtenidas.contains(where: { $0.id == insignia.id && $0.visitaId == visita.id }) ? zonaColor : Color.gray)
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
        nombre: "Eco Guerrero",
        imagen: "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png",
        descripcion: "Insignia por promover acciones ecológicas",
        completado: false,
        idNFC: 1
    )
    BadgeView(insignia: sampleInsignia, visita: Visita(id: 1, date: Date(), orden: "Pertenezco Comunico Comprendo Soy Expreso Pequeño"), zonaColor: Color.gray)
}
