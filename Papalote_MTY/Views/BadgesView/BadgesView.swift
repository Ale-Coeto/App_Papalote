import SwiftUI
import SwiftData

struct BadgesView: View {
    @Environment(\.modelContext) private var context
    @Query private var zonas: [Zona]
    @Query private var insignias: [Insignia]
    @Query private var insigniasObtenidas: [InsigniaObtenida]
    
    @State private var showSheet = false
    let visita: Visita
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(zonas, id: \.self.id) { zona in
                    // Filter insignias based on the zonaId matching the current zona
                    let filteredInsignias = insignias.filter { $0.idZona == zona.id }
                    
                    // Create the isCompleted array based on the filteredInsignias
                    let isCompleted = filteredInsignias.map { insignia in
                        // Check if there's an InsigniaObtenida for this insignia and the current visitaId
                        return insigniasObtenidas.contains { $0.id == insignia.id && $0.visitaId == visita.id }
                    }
                    
                    BadgeScrollView(sectionName: zona.nombre, insignias: filteredInsignias, isCompleted: isCompleted, showSheet: $showSheet)
                }
            }
            .padding()
            .background(Color(red: 240/255, green: 244/255, blue: 248/255))
        }
        .onAppear {
            MockDataManager.addMockData(to: context)
        }
    }
}


#Preview {
    BadgesView(visita: Visita(id: 1, date: Date(), orden: "Pertenezco Comunico Comprendo Soy Expreso Pequeño"))
        .modelContainer(for: [Zona.self, InsigniaObtenida.self, Insignia.self, Evento.self, Visita.self, Foto.self, Exhibicion.self], inMemory: true)
}
