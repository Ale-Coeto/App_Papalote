//
//  BadgeView.swift
//  Reto
//
//  Created by Oscar Zhao Xu on 17/10/24.
//

import SwiftUI
import SwiftData
import SimpleToast

struct BadgeView: View {
    let insignia: Insignia
    let visita: Visita
    var zonaColor : Color
    
    @StateObject var NFCR = NFCReader()
    @StateObject var tagsList = NFCTagsList()
    @State var Tag: NFCTag = NFCTag(id: 0, tagName: "", date: nil, scanned: false)
    @State var showPopup = false
    
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) var dismiss
    @Query private var insigniasObtenidas: [InsigniaObtenida]
    
    @State var showToast: Bool = false
   @State private var toastMessage = ""
   @State private var isCorrect = false
    
    private let toastOptions = SimpleToastOptions(
        hideAfter: 3,
        animation: .bouncy
    )
    
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
                NFCR.startReading { tag in
                    // Create the NFCTag object using the current date and changing the scanned value to true
                    Tag = NFCTag(id: tag.id, tagName: tag.tagName, date: Date(), scanned: true)
                    tagsList.addTag(Tag)
                    
                    // Check if the scanned tag matches the expected NFCTag ID
                    if Tag.id == insignia.idNFC {
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
                                toastMessage = "Obtuviste la insignia"
                                isCorrect = true
                                showToast = true
                                hideToastAfterDelay()
                            } catch {
                                print("Error saving new InsigniaObtenida: \(error)")
                            }
                        } else {
                            // Show already obtained toast
                            toastMessage = "Insignia ya obtenida"
                            isCorrect = true
                            showToast = true
                            hideToastAfterDelay()
                        }
                    } else {
                        print("Scanned NFC tag does not match the expected ID.")
                        toastMessage = "Tag incorrecto"
                        isCorrect = false
                        showToast = true
                        hideToastAfterDelay()
                    }
                }
            } label: {
                Text("Escanear")
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
        .simpleToast(isPresented: $showToast, options: toastOptions) {
            Label(toastMessage, systemImage: isCorrect ? "checkmark.circle" : "xmark.circle")
                .padding()
                .background(isCorrect ? Color.green : Color.red)
                .foregroundColor(Color.white)
                .cornerRadius(10)
                .padding(.top, 30)
        }
    }
    private func hideToastAfterDelay() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
            withAnimation {
                showToast = false
            }
            dismiss()
        }
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
        idNFC: "1"
    )
    BadgeView(insignia: sampleInsignia, visita: Visita(id: 1, date: Date(), orden: "Pertenezco Comunico Comprendo Soy Expreso Pequeño"), zonaColor: Color.gray)
}
