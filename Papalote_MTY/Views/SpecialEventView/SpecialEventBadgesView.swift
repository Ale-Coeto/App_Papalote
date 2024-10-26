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
        NavigationStack { // Move NavigationStack here
            ScrollView {
                VStack {
                    // Title for the Event
                    Text("Gana insignias de tiempo limitado!")
                        .font(.title3) // Title font size
                        .padding(.top) // Padding at the top for better spacing
                        .padding(.bottom)
                    
                    // Grid for displaying insignias
                    let columns = [
                        GridItem(.flexible()), // Flexible layout for 2 badges per row
                        GridItem(.flexible())
                    ]
                    
                    LazyVGrid(columns: columns, spacing: 20) {
                        // Sort insignias by ID before displaying
                        ForEach(insignias.filter { $0.idEvento == evento.id }.sorted(by: { $0.id < $1.id }), id: \.self.id) { insignia in
                            NavigationLink(destination: BadgeView(insignia: insignia, visita: visita)) {
                                VStack {
                                    AsyncImage(url: URL(string: insignia.imagen)) { image in
                                        image
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 80, height: 80) // Fixed image size
                                            .clipShape(Circle())
                                            .overlay {
                                                // Check if insignia is completed for this visita
                                                let isCompleted = insigniasObtenidas.contains {
                                                    $0.id == insignia.id && $0.visitaId == visita.id
                                                }
                                                Circle()
                                                    .stroke(isCompleted ? Color.green : Color.gray, lineWidth: 5)
                                            }
                                    } placeholder: {
                                        ProgressView()
                                            .frame(width: 80, height: 80) // Fixed placeholder size
                                    }
                                    Text(insignia.nombre) // Display insignia name
                                        .font(.caption.bold()) // Bold the name of the insignia
                                        .multilineTextAlignment(.center)
                                }
                                .frame(width: 120, height: 120) // Fixed size for the badge box
                                .padding() // Add padding inside the badge section
                                .background(Color.white) // Background color for the badge
                                .cornerRadius(12) // Rounded corners
                                .shadow(color: Color.black.opacity(0.2), radius: 5, x: 2, y: 2) // Shadow effect
                            }
                            .buttonStyle(PlainButtonStyle()) // Remove default button style for better appearance
                        }
                    }
                    .padding(.horizontal)
                }
            }
            .navigationTitle("\(evento.nombre)") // Set the navigation title here
            .navigationBarTitleDisplayMode(.inline) // Optional: adjust title display mode
            .toolbar {
                // Customize the navigation bar title appearance
                ToolbarItem(placement: .principal) {
                    Text(evento.nombre)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color.black)
                }
            }
        }
    }
}

#Preview {
    let sampleEvento = Evento(id: 1, fechaInicio: Date(), fechaFin: Date(), nombre: "Semana Cosmica", descripcion: "Día del espacio", imagen: "a")
    let sampleVisita = Visita(id: 1, date: Date(), orden: "Pertenezco Comunico Comprendo Soy Expreso Pequeño")
    
    SpecialEventBadgesView(evento: sampleEvento, visita: sampleVisita)
        .modelContainer(for: [Insignia.self, InsigniaObtenida.self], inMemory: true) // Adjust model as needed
}

