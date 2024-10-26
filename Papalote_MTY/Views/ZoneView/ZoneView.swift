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
    var zona: Zona
    var exhibiciones: [Exhibicion]
    var insignias: [Insignia]
    var fotos: [Foto]
    var visita: Visita

    @Query private var insigniasObtenidas: [InsigniaObtenida]

    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Text(zona.descripcion)
                // Exhibiciones section
                VStack {
                    Text("Exhibiciones")
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                    ScrollView(.horizontal, showsIndicators: true) {
                        HStack(spacing: 40) {
                            ForEach(exhibiciones.sorted(by: { $0.id < $1.id }), id: \.self.id) { exhibicion in
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
                                                Circle()
                                                    .stroke(exhibicion.completado ? Color.green : Color.gray, lineWidth: 5)
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

                // Insignias section
                VStack {
                    Text("Insignias")
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                    ScrollView(.horizontal, showsIndicators: true) {
                        HStack(spacing: 40) {
                            ForEach(insignias.sorted(by: { $0.id < $1.id }), id: \.self.id) { insignia in
                                NavigationLink {
                                    BadgeView(insignia: insignia, visita: visita)
                                } label: {
                                    AsyncImage(url: URL(string: insignia.imagen)) { image in
                                        image
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 80, height: 80)
                                            .clipShape(Circle())
                                            .overlay {
                                                // Check if insignia is in `insigniasObtenidas` for this `visita`
                                                let isCompleted = insigniasObtenidas.contains {
                                                    $0.id == insignia.id && $0.visitaId == visita.id
                                                }
                                                Circle()
                                                    .stroke(isCompleted ? Color.green : Color.gray, lineWidth: 5)
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

                // Fotos section
                VStack {
                    Text("Fotos")
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                    ScrollView(.horizontal, showsIndicators: true) {
                        HStack(spacing: 40) {
                            ForEach(fotos.sorted(by: { $0.id < $1.id }), id: \.self.id) { foto in
                                NavigationLink {
                                    PhotoView(foto: foto)
                                } label: {
                                    if let imageData = foto.imagen, let image = UIImage(data: imageData) {
                                        Image(uiImage: image)
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 80, height: 80)
                                            .clipShape(Circle())
                                            .overlay {
                                                Circle()
                                                    .stroke(foto.completado ? Color.green : Color.gray, lineWidth: 5)
                                            }
                                    } else {
                                        Image(systemName: "photo")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 80, height: 80)
                                            .foregroundColor(.gray)
                                            .clipShape(Circle())
                                            .overlay {
                                                Circle()
                                                    .stroke(foto.completado ? Color.green : Color.gray, lineWidth: 5)
                                            }
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
            .padding(.top, Constants.HEADER_HEIGHT)
            .padding(.bottom, 40)
            .navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text(zona.nombre)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color.black)
                }
            }
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
        completado: false,
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
        completado: false,
        idNFC: 1
    )]
    let samplePhoto = [Foto(
        id: 1,
        idZona: 1,
        idVisita: 1,
        imagen: nil,
        completado: false
    )]
    ZoneView(zona: sampleZona, exhibiciones: sampleExhibition, insignias: sampleInsignia, fotos: samplePhoto, visita: Visita(id: 1, date: Date(), orden: "Pertenezco Comunico Comprendo Soy Expreso Pequeño"))
        .modelContainer(for: [Zona.self, InsigniaObtenida.self, Insignia.self, Evento.self, Visita.self, Foto.self, Exhibicion.self], inMemory: true)
}
