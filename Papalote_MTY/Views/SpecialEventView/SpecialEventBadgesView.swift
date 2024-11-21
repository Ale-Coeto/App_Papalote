//
//  InfographicView.swift
//  Papalote_MTY
//
//  Created by Rodrigo Garcia on 25/10/24.
//
import SwiftUI
import SwiftData

struct SpecialEventBadgesView: View {
    let evento: Evento
    let visita: Visita
    
    @Query var insignias: [Insignia]
    @Query var insigniasObtenidas: [InsigniaObtenida]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    // Title for the Event
                    Text("Gana insignias de tiempo limitado!")
                        .font(.title3)
                        .padding(.top)
                        .padding(.bottom)
                    
                    // Grid for displaying insignias
                    let columns = [
                        GridItem(.flexible()),
                        GridItem(.flexible())
                    ]
                    
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(insignias.filter { $0.idEvento == evento.id }.sorted(by: { $0.id < $1.id }), id: \.self.id) { insignia in
                            NavigationLink(destination: BadgeView(insignia: insignia, visita: visita, zonaColor: Color.green)) {
                                VStack {
                                    AsyncImage(url: URL(string: insignia.imagen)) { image in
                                        image
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 80, height: 80) // Fixed image size
                                            .clipShape(Circle())
                                            .overlay {
                                                let isCompleted = insigniasObtenidas.contains {
                                                    $0.id == insignia.id && $0.visitaId == visita.id
                                                }
                                                Circle()
                                                    .stroke(isCompleted ? Color.green : Color.gray, lineWidth: 5)
                                            }
                                    } placeholder: {
                                        ProgressView()
                                            .frame(width: 80, height: 80) // xFixed placeholder size
                                    }
                                    
                                    // Fixed height for the text area to align it consistently
                                    Text(insignia.nombre)
                                        .font(.caption.bold())
                                        .multilineTextAlignment(.center)
                                        .frame(height: 31) // Fixed height for text
                                        .lineLimit(2) // Limit to 2 lines, adjust if needed
                                }
                                .frame(width: 120, height: 120)
                                .padding()
                                .background(Color.white)
                                .cornerRadius(12)
                                .shadow(color: Color.black.opacity(0.2), radius: 5, x: 2, y: 2)
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                    .padding(.horizontal)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    let sampleEvento = Evento(id: 1, fechaInicio: Date(), fechaFin: Date(), nombre: "Semana Cosmica", descripcion: "Día del espacio", imagen: "a")
    let sampleVisita = Visita(id: 1, date: Date(), orden: "Pertenezco Comunico Comprendo Soy Expreso Pequeño")
    
    SpecialEventBadgesView(evento: sampleEvento, visita: sampleVisita)
        .modelContainer(for: [Insignia.self, InsigniaObtenida.self, FetchedDate.self], inMemory: true)
}
