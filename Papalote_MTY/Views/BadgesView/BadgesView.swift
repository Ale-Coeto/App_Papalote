import SwiftUI
import SwiftData

struct BadgesView: View {
    @Environment(\.modelContext) private var context
    @Query private var zonas: [Zona]
    @Query private var eventos: [Evento] // Added Eventos query
    
    let visita: Visita
    
    var body: some View {
        // Use the sorting function from ZonaSorting.swift
        let sortedZonas = sortZonasByOrden(zonas: zonas, orden: visita.orden)
        
        // Sort Eventos
        let sortedEventos = eventos.sorted {
            $0.fechaInicio < $1.fechaInicio // Sorting by start date
        }
        
        return ScrollView {
            VStack {
                // Display Zona badges
                ForEach(sortedZonas, id: \.self.id) { zona in
                    BadgeScrollView(zona: zona, visita: visita, isEvento: false)
                }
                
                // Display Evento badges
                ForEach(sortedEventos, id: \.self.id) { evento in
                    BadgeScrollView(evento: evento, visita: visita, isEvento: true)
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
        .modelContainer(for: [Zona.self, Evento.self, InsigniaObtenida.self, Insignia.self, Visita.self], inMemory: true)
}
