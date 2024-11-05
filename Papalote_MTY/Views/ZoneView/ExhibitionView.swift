//
//  BadgeView.swift
//  Reto
//
//  Created by Oscar Zhao Xu on 17/10/24.
//

import SwiftUI
import SwiftData


struct ExhibitionView: View {
    
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) var dismiss
    var zonaColor : Color 
    @State var exhibicion: Exhibicion
    let visita: Visita
    @Query private var exhibicionesObtenidas: [ExhibicionObtenida]
    var body: some View {
        VStack(spacing: 20) {
            Text(exhibicion.nombre)
                .font(Font.custom("VagRoundedBold", size: 40))
                .multilineTextAlignment(.center)
                .fontWeight(.bold)
                .padding(.top, 20)
            
            Divider()
                .frame(minHeight: 5)
                .background(zonaColor)
            
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
                .font(Font.custom("VagRounded-Light", size: 20))
                .multilineTextAlignment(.center)
                .padding(.horizontal, 30)
                .padding(.vertical, 10)
                .cornerRadius(12)
            
            Button {
                
                // Check if the Exhibicion has already been obtained for the current visita
                if !exhibicionesObtenidas.contains(where: { $0.id == exhibicion.id && $0.visitaId == visita.id }) {
                    // Create a new InsigniaObtenida instance
                    let newExhibicionObtenida = ExhibicionObtenida(id: exhibicion.id, visitaId: visita.id)
                    
                    // Add it to the context
                    context.insert(newExhibicionObtenida)
                   // print("Esta es la nueva exhibicion")
                    //print(newExhibicionObtenida)
                    // Save the context (if applicable in your environment)
                    do {
                        try context.save()
                        // Dismiss the BadgeView after saving
                        dismiss() // Dismisses the view
                    } catch {
                        print("Error saving new exhibicion obtenida: \(error)")
                    }
                } else {
                    // Dismiss even if insignia is already obtained
                    dismiss() // Dismisses the view
                }
                //exhibicion.completado.toggle()
            } label: {
                Text("Completar")
                    .font(Font.custom("VagRoundedBold", size: 24))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.horizontal, 40)
                    .padding(.vertical, 15)
                    .background(exhibicionesObtenidas.contains(where: { $0.id == exhibicion.id && $0.visitaId == visita.id }) ? Color(zonaColor) : Color.gray)
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
    ExhibitionView(zonaColor: Color.green, exhibicion: sampleExhibition, visita: Visita(id: 1, date: Date(), orden: "Pertenezco Comunico Comprendo Soy Expreso Pequeño"))
}

