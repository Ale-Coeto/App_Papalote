import SwiftUI
import SwiftData

struct BadgesView: View {
    @Environment(\.modelContext) private var context
    @Query private var zonas: [Zona]
    @Query private var insignias: [Insignia]
    @Query private var insigniasObtenidas: [InsigniaObtenida]
    
    @State private var showSheet = false
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(zonas, id: \.self.id) { zona in
                    // Filter insignias based on the zonaId matching the current zona
                    let filteredInsignias = insignias.filter { $0.zonaId == zona.id }
                    
                    BadgeScrollView(sectionName: zona.nombre, insignias: filteredInsignias, showSheet: $showSheet)
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
    BadgesView()
        .modelContainer(for: [Zona.self, InsigniaObtenida.self, Insignia.self, Evento.self, Visita.self], inMemory: true)
}
