import SwiftUI
import SwiftData

struct BadgeScrollView: View {
    var zona: Zona // Now it takes zona directly
    let visita: Visita
    let isEventoEspecial: Bool
    
    @Environment(\.modelContext) private var context
    @Query private var insignias: [Insignia]
    @Query private var insigniasObtenidas: [InsigniaObtenida]
    
    @State private var selectedInsignia: Insignia? // State to track the selected insignia
    
    var body: some View {
        // Filter insignias based on the passed zona or evento
        /*let filteredInsignias = isEventoEspecial ? insignias.filter { $0.idZona == zona.id } : insignias.filter { $0.idEvento == zona.id }
            .sorted(by: { $0.id < $1.id })*/
        let filteredInsignias = insignias.filter { $0.idZona == zona.id }.sorted(by: { $0.id < $1.id })

        
        let isCompleted = getIsCompletedList(for: filteredInsignias)
        
        VStack(alignment: .leading, spacing: 10) {
            VStack(alignment: .leading) {
                Text(zona.nombre)
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(.gray)
                    .padding([.top, .leading, .trailing])
                
                ScrollView(.horizontal, showsIndicators: true) {
                    HStack(spacing: 15) {
                        ForEach(Array(filteredInsignias.enumerated()), id: \.element.id) { index, insignia in
                            Button(action: {
                                selectedInsignia = insignia // Set the clicked insignia
                            }) {
                                // Async image for insignia image URL
                                AsyncImage(url: URL(string: insignia.imagen)) { phase in
                                    if let image = phase.image {
                                        image
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 50, height: 50)
                                            .background(Color.white)
                                            .clipShape(Circle())
                                            .overlay(
                                                // Overlay with conditional border based on isCompleted
                                                Circle().stroke(isCompleted[index] ? Color.green : Color.gray, lineWidth: 3.5)
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
                            .sheet(item: $selectedInsignia) { insignia in
                                BadgeView(insignia: insignia, visita: visita)
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
        isEventoEspecial: false
    )
}
