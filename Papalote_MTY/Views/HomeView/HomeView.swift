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
    
    @StateObject var viewModel = HomeViewModel()
    var body: some View {
        NavigationStack {
            HomeLayoutView(title: "Zonas")
                .overlay(
                    VStack {
                        
                        Card(title: viewModel.eventoEspecial.nombre, content: viewModel.eventoEspecial.descripcion)
                            .frame(height: 200)
                        
                        VStack (spacing: 20) {
                            ForEach(zonas, id: \.self.id) { zona in
                                let filteredExhibicion = exhibiciones.filter { $0.idZona == zona.id }
                                let filteredInsignias = insignias.filter { $0.idZona == zona.id }
                                let filteredFotos = fotos.filter { $0.idZona == zona.id }
                                NavigationLink {
                                    ZoneView(zona: zona, exhibiciones: filteredExhibicion, insignias: filteredInsignias, fotos: filteredFotos)
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
                                            
                                            ZStack (alignment: .trailing) {
                                                HStack (spacing: 0) {
                                                    
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

#Preview {
    HomeView()
        .modelContainer(for: [Zona.self, InsigniaObtenida.self, Insignia.self, Evento.self, Visita.self, Foto.self, Exhibicion.self], inMemory: true)
}
