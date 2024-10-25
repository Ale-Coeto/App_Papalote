import SwiftUI
import SwiftData

struct BadgesView: View {
    @Environment(\.modelContext) private var context
    @Query private var zonas: [Zona]
    
    let visita: Visita
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(zonas, id: \.self.id) { zona in
                    // Pass only zona and visita to BadgeScrollView
                    BadgeScrollView(zona: zona, visita: visita)
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
