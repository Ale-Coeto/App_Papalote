//
//  ContentView.swift
//  Reto
//
//  Created by Oscar Zhao Xu on 17/10/24.
//

import SwiftUI
import SwiftData

struct ZoneView: View {
    var zona: Zona
    var exhibiciones: [Exhibicion]
    var insignias: [Insignia]
    var fotos: [Foto]
    
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
    }
}

#Preview {
    let sampleZona = Zona(
        id: 1,
        nombre: "Pertenezco",
        descripcion: "aaaa",
        color: "#C4D600",
        logo: "Pertenezco"
    )
    let sampleExhibition = [Exhibicion(
        id: 1,
        idZona: 1,
        nombre: "Exhibición de Arte Moderno",
        descripcion: "Una colección de obras de arte moderno de varios artistas.",
        imagen: "https://w7.pngwing.com/pngs/963/1005/png-transparent-modern-art-drawing-visual-arts-design-child-text-cartoon.png",
        isOpen: true,
        location: "Sala de Arte"
    )]
    let sampleInsignia = [Insignia(
        id: 1,
        idZona: 1,
        idEvento: -1,
        nombre: "SuperPoderosa",
        imagen: "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png",
        descripcion: "no_descripcion",
        idNFC: 1
    )]
    let samplePhoto = [Foto(
        id: 1,
        idZona: 1,
        idVisita: 1,
        imagen: "https://i.pinimg.com/474x/e0/af/b1/e0afb1f32c8af2af99cdfbb227edc885.jpg"
    )]
    ZoneView(zona: sampleZona, exhibiciones: sampleExhibition, insignias: sampleInsignia, fotos: samplePhoto)
        .modelContainer(for: [Zona.self, InsigniaObtenida.self, Insignia.self, Evento.self, Visita.self, Foto.self, Exhibicion.self], inMemory: true)
}
