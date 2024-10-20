//
//  ContentView.swift
//  Reto
//
//  Created by Oscar Zhao Xu on 17/10/24.
//

import SwiftUI
import SwiftData

struct ZoneView: View {
    @Environment(\.modelContext) private var context
    let zona: Zona
    @Query private var insignias: [Insignia]
    @Query private var exhibiciones: [Exhibicion]
    @Query private var fotos: [Foto]
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Text(zona.descripcion)
                VStack {
                    Text("Exhibiciones")
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                    ScrollView(.horizontal, showsIndicators: true) {
                        HStack(spacing: 40) {
                            ForEach(exhibiciones) { exhibicion in
                                NavigationLink {
                                    ExhibitionView(exhibicion: exhibicion)
                                } label: {
                                    AsyncImage(url: URL(string: exhibicion.imagen)) { image in
                                        image
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 80, height: 80)
                                            .clipShape(Circle())
                                            .overlay {
                                                Circle().stroke(Color.green, lineWidth: 5)
                                            }
                                    } placeholder: {
                                        ProgressView()
                                            .frame(width: 80, height: 80)
                                    }
                                }
                            }
                        }
                        .padding(.horizontal, 5)
                        .padding(.vertical, 5)
                    }
                }
                .padding()
                .background(Color.white)
                .cornerRadius(12)
                .shadow(color: Color.black.opacity(0.5), radius: 5, x: 4, y: 4)
            
                VStack {
                    Text("Insignias")
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                    ScrollView(.horizontal, showsIndicators: true) {
                        HStack(spacing: 40) {
                            ForEach(insignias) { insignia in
                                NavigationLink {
                                    BadgeView(insignia: insignia)
                                } label: {
                                    AsyncImage(url: URL(string: insignia.imagen)) { image in
                                        image
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 80, height: 80)
                                            .clipShape(Circle())
                                            .overlay {
                                                Circle().stroke(Color.green, lineWidth: 5)
                                            }
                                    } placeholder: {
                                        ProgressView()
                                            .frame(width: 80, height: 80)
                                    }
                                }
                            }
                        }
                        .padding(.horizontal, 5)
                        .padding(.vertical, 5)
                    }
                }
                .padding()
                .background(Color.white)
                .cornerRadius(12)
                .shadow(color: Color.black.opacity(0.5), radius: 5, x: 4, y: 4)
            
                VStack {
                    Text("Fotos")
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                    ScrollView(.horizontal, showsIndicators: true) {
                        HStack(spacing: 40) {
                            ForEach(fotos) { foto in
                                NavigationLink {
                                    PhotoView(foto: foto)
                                } label: {
                                    AsyncImage(url: URL(string: foto.imagen)) { image in
                                        image
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 80, height: 80)
                                            .clipShape(Circle())
                                            .overlay {
                                                Circle().stroke(Color.green, lineWidth: 5)
                                            }
                                    } placeholder: {
                                        ProgressView()
                                            .frame(width: 80, height: 80)
                                    }
                                }
                            }
                        }
                        .padding(.horizontal, 5)
                        .padding(.vertical, 5)
                    }
                }
                .padding()
                .background(Color.white)
                .cornerRadius(12)
                .shadow(color: Color.black.opacity(0.5), radius: 5, x: 4, y: 4)
                
                
            }
            .padding()
            .padding(.bottom, 40)
            .navigationTitle(zona.nombre)
            .multilineTextAlignment(.center)
        }
        .onAppear {
            MockDataManager.addMockData(to: context)
        }
    }
}

#Preview {
    let sampleZona = Zona(
        id: 1,
        nombre: "Pertenezco",
        descripcion: "aaaa",
        color: "#C4D600",
        logo: "Pertenezco")
    ZoneView(zona: sampleZona)
        .modelContainer(for: [Zona.self, InsigniaObtenida.self, Insignia.self, Evento.self, Visita.self, Foto.self, Exhibicion.self], inMemory: true)
}
