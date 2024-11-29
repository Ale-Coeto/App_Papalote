import SwiftUI
import SwiftData

struct BadgeScrollView: View {
    var zona: Zona? // Optional Zona
    var evento: Evento? // Optional Evento
    let visita: Visita
    let isEvento: Bool // Flag to differentiate between Zona and Evento
    @Environment(\.modelContext) private var context
    @Query private var insignias: [Insignia]
    @Query private var insigniasObtenidas: [InsigniaObtenida]
    @Query private var linkToImages: [LinkToImage]
    @State private var selectedInsignia: Insignia? // State to track the selected insignia
    
    var body: some View {
        let zoneColor: Color = (zona !== nil ? Color(hex: zona!.color) : Color.green)
        // Filter insignias based on whether it's for a Zona or Evento
        let filteredInsignias = isEvento ?
            insignias.filter { $0.idEvento == evento?.id } :
            insignias.filter { $0.idZona == zona?.id }
        let sortedInsignias = filteredInsignias.sorted(by: { $0.id < $1.id })

        let isCompleted = getIsCompletedList(for: sortedInsignias)

        VStack(alignment: .leading, spacing: 10) {
            VStack(alignment: .leading) {
                Text(isEvento ? (evento?.nombre ?? "Evento") : (zona?.nombre ?? "Zona"))
                    .font(Font.custom("VagRoundedBold", size: 20))
                    .padding([.top, .leading, .trailing])

                ScrollView(.horizontal, showsIndicators: true) {
                    HStack(spacing: 15) {
                        ForEach(Array(sortedInsignias.enumerated()), id: \.element.id) { index, insignia in
                            Button(action: {
                                selectedInsignia = insignia // Set the clicked insignia
                            }) {
                                // Async image for insignia image URL
                                if let imageData = linkToImages.first(where: { $0.link == insignia.imagen })?.imagen,
                                   let uiImage = UIImage(data: imageData) {
                                    Image(uiImage: uiImage)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 50, height: 50)
                                        .background(Color.white)
                                        .clipShape(Circle())
                                        .overlay(
                                                // Conditional grayish overlay
                                                !isCompleted[index]
                                                    ? Circle().fill(Color.gray.opacity(0.8))
                                                    : Circle().fill(Color.clear)
                                            )
                                        .overlay(
                                            Circle().stroke(isCompleted[index] ? zoneColor : Color.gray, lineWidth: 3.5)
                                        )
                                        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
                                        .padding(8)
                                } else {
                                    AsyncImage(url: URL(string: insignia.imagen)) { phase in
                                        if let image = phase.image {
                                            image
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 50, height: 50)
                                                .background(Color.white)
                                                .clipShape(Circle())
                                                .overlay(
                                                        // Conditional grayish overlay
                                                        !isCompleted[index]
                                                            ? Circle().fill(Color.gray.opacity(0.8))
                                                            : Circle().fill(Color.clear)
                                                    )
                                                .overlay(
                                                    // Overlay with conditional border based on isCompleted
                                                    Circle().stroke(isCompleted[index] ? zoneColor : Color.gray, lineWidth: 3.5)
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
                                
                                /*AsyncImage(url: URL(string: insignia.imagen)) { phase in
                                    if let image = phase.image {
                                        image
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 50, height: 50)
                                            .background(Color.white)
                                            .clipShape(Circle())
                                            .overlay(
                                                // Overlay with conditional border based on isCompleted
                                                Circle().stroke(isCompleted[index] ? zoneColor : Color.gray, lineWidth: 3.5)
                                            )
                                            .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
                                            .padding(8)
                                    } else {
                                        Circle()
                                            .fill(Color.gray.opacity(0.5))
                                            .frame(width: 50, height: 50)
                                    }
                                }*/
                            }
                            .sheet(item: $selectedInsignia) { insignia in
                                BadgeView(insignia: insignia, visita: visita, zonaColor: zoneColor)
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
    
    // Helper function to determine if insignias are completed
    private func getIsCompletedList(for insignias: [Insignia]) -> [Bool] {
        return insignias.map { insignia in
            return insigniasObtenidas.contains { $0.id == insignia.id && $0.visitaId == visita.id }
        }
    }
}

#Preview {
    BadgeScrollView(
        zona: Zona(id: 1, nombre: "Zona 1", descripcion: "", color: "", logo: ""),
        visita: Visita(id: 1, date: Date(), orden: "Pertenezco Comunico Comprendo Soy Expreso Pequeño"),
        isEvento: false
    )
    BadgeScrollView(
        evento: Evento(id: 1, fechaInicio: Date(), fechaFin: Date(), nombre: "Evento 1", descripcion: "", imagen: ""),
        visita: Visita(id: 1, date: Date(), orden: "Pertenezco Comunico Comprendo Soy Expreso Pequeño"),
        isEvento: true
    )
}
