//
//  HomeView.swift
//  Papalote_MTY
//
//  Created by Alejandra Coeto on 14/10/24.
//

import SwiftUI
import SwiftData

struct HomeView: View {
    @Environment(\.modelContext) private var context
    @Query private var zonas: [Zona]
    @Query private var exhibiciones: [Exhibicion]
    @Query private var insignias: [Insignia]
    @Query private var fotos: [Foto]
    @Query private var eventosEspeciales: [Evento]
    
    let visita: Visita
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationStack {
            HomeLayoutView(title: "Zonas")
                .overlay(
                    VStack {
                        ForEach(eventosEspeciales, id: \.id) { evento in
                            NavigationLink(destination: EventDetailView(evento: evento)) {
                                VStack {
                                    Text("Evento de tiempo Limitado!")
                                        .font(.headline)
                                        .foregroundColor(.gray)
                                    Text(evento.nombre)
                                        .font(.title3)
                                        .bold()
                                        .foregroundColor(.black)
                                    Text(evento.descripcion)
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                    // Displaying "solo disponible hasta" with the formatted date
                                    Text("Solo disponible hasta \(formattedDate(evento.fechaFin))")
                                        .font(.footnote)
                                        .foregroundColor(.red)
                                        .padding(.top, 5)
                                }
                                .frame(height: 140)
                                .frame(width: 300)
                                .padding()
                                .background(
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(Color.white)
                                        .shadow(radius: 5)
                                )
                            }
                            .buttonStyle(PlainButtonStyle())
                            .padding(.bottom, 20)
                        }

                        
                        VStack(spacing: 20) {
                            ForEach(zonas.sorted(by: { $0.id < $1.id }), id: \.self.id) { zona in
                                let filteredExhibicion = exhibiciones.filter { $0.idZona == zona.id }
                                let filteredInsignias = insignias.filter { $0.idZona == zona.id }
                                let filteredFotos = fotos.filter { $0.idZona == zona.id }
                                NavigationLink {
                                    ZoneView(zona: zona, exhibiciones: filteredExhibicion, insignias: filteredInsignias, fotos: filteredFotos, visita: visita)
                                } label: {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 10)
                                            .fill(Color(hex: zona.color))
                                            .shadow(radius: 5)
                                            .frame(minHeight: 50)
                                        HStack {
                                            Text(zona.nombre)
                                                .foregroundStyle(.white)
                                                .padding(.leading)
                                            Spacer()
                                            ZStack(alignment: .trailing) {
                                                HStack(spacing: 0) {
                                                    RightTriangle(width: 25, color: .white)
                                                    ZStack {
                                                        CustomRoundedRectangle(topLeftRadius: 0, topRightRadius: 10, bottomLeftRadius: 0, bottomRightRadius: 10)
                                                            .fill(.white)
                                                            .frame(width: 80)
                                                        Image(zona.logo)
                                                            .resizable()
                                                            .aspectRatio(contentMode: .fit)
                                                            .padding(10)
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        .padding()
                    }
                        .padding(.top, Constants.HEADER_HEIGHT)
                        .padding()
                )
        }
        .onAppear {
            MockDataManager.addMockData(to: context)
        }
    }
}

// Example EventDetailView for the destination
struct EventDetailView: View {
    let evento: Evento
    
    var body: some View {
        VStack {
            Text(evento.nombre)
                .font(.largeTitle)
                .padding()
            Text(evento.descripcion)
                .font(.body)
                .padding()
        }
        .navigationTitle("Evento Especial")
    }
}

func formattedDate(_ date: Date) -> String {
    let formatter = DateFormatter()
    formatter.dateStyle = .medium
    formatter.locale = Locale(identifier: "es_ES") // Spanish locale for date formatting
    return formatter.string(from: date)
}

#Preview {
    HomeView(visita: Visita(id: 1, date: Date(), orden: "Pertenezco Comunico Comprendo Soy Expreso Pequeño"))
        .modelContainer(for: [Zona.self, InsigniaObtenida.self, Insignia.self, Evento.self, Visita.self, Foto.self, Exhibicion.self], inMemory: true)
}
