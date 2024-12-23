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
    @Query private var exhibicionesObtenidas: [ExhibicionObtenida]
    @Query private var linkToImages: [LinkToImage]
    
    var sortedExhibiciones: [Exhibicion] {
            exhibiciones.sorted(by: { $0.id < $1.id })
        }

    var sortedInsignias: [Insignia] {
        insignias.sorted(by: { $0.id < $1.id })
    }
    var sortedFotos: [Foto]{
        fotos.sorted(by: { $0.id < $1.id })
    }
    var body: some View {
        //let firstId = sortedFotos.isEmpty ? 1 : sortedFotos[0].id
        NavigationStack {
            HomeLayoutView(title: zona.nombre, headerColor: Color(hex: zona.color))
                .overlay(
                    ScrollView {
                        VStack(spacing: 20) {
                            Spacer()
                            Text(zona.descripcion)
                                .padding(10)
                                .font(Font.custom("VagRounded-Light", size: 20))
                            // Exhibiciones section
                            VStack {
                                Text("Exhibiciones")
                                    .font(Font.custom("VagRoundedBold", size: 20))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                ScrollView(.horizontal, showsIndicators: true) {
                                    HStack(spacing: 40) {
                                        ForEach(sortedExhibiciones, id: \.self.id) { exhibicion in
                                            NavigationLink {
                                                ExhibitionView(zonaColor: Color(hex: zona.color), exhibicion: exhibicion, visita: visita)
                                            } label: {
                                                if let imageData = linkToImages.first(where: { $0.link == exhibicion.imagen })?.imagen,
                                                   let uiImage = UIImage(data: imageData) {
                                                    Image(uiImage: uiImage)
                                                        .resizable()
                                                        .frame(width: 80, height: 80)
                                                        .clipShape(Circle())
                                                        .overlay {
                                                            let isCompleted = exhibicionesObtenidas.contains {
                                                                $0.id == exhibicion.id && $0.visitaId == visita.id
                                                            }
                                                            Circle()
                                                                .stroke(isCompleted ? Color(hex: zona.color) : Color.gray, lineWidth: 5)
                                                        }
                                                } else {
                                                    AsyncImage(url: URL(string: exhibicion.imagen)) { image in
                                                        image
                                                            .resizable()
                                                            .frame(width: 80, height: 80)
                                                            .clipShape(Circle())
                                                            .overlay {
                                                                let isCompleted = exhibicionesObtenidas.contains {
                                                                    $0.id == exhibicion.id && $0.visitaId == visita.id
                                                                }
                                                                Circle()
                                                                    .stroke(isCompleted ? Color(hex: zona.color) : Color.gray, lineWidth: 5)
                                                            }
                                                    } placeholder: {
                                                        ProgressView()
                                                            .frame(width: 80, height: 80)
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
                            .frame(width: 360)
                            .shadow(color: Color.black.opacity(0.5), radius: 5, x: 4, y: 4)
                            
                            // Insignias section
                            VStack {
                                Text("Insignias")
                                    .font(Font.custom("VagRoundedBold", size: 20))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                ScrollView(.horizontal, showsIndicators: true) {
                                    HStack(spacing: 40) {
                                        ForEach(sortedInsignias, id: \.self.id) { insignia in
                                            NavigationLink {
                                                BadgeView(insignia: insignia, visita: visita, zonaColor: Color(hex: zona.color))
                                            } label: {
                                                if let imageData = linkToImages.first(where: { $0.link == insignia.imagen })?.imagen,
                                                   let uiImage = UIImage(data: imageData) {
                                                    Image(uiImage: uiImage)
                                                        .resizable()
                                                        .frame(width: 80, height: 80)
                                                        .clipShape(Circle())
                                                        .overlay {
                                                            // Check if insignia is in `insigniasObtenidas` for this `visita`
                                                            let isCompleted = insigniasObtenidas.contains {
                                                                $0.id == insignia.id && $0.visitaId == visita.id
                                                            }
                                                            !isCompleted
                                                                ? Circle().fill(Color.black.opacity(0.3))
                                                                : Circle().fill(Color.clear)
                                                            Circle()
                                                                .stroke(isCompleted ? Color(hex: zona.color) : Color.gray, lineWidth: 5)
                                                        }
                                                } else  {
                                                    AsyncImage(url: URL(string: insignia.imagen)) { image in
                                                        image
                                                            .resizable()
                                                            .frame(width: 80, height: 80)
                                                            .clipShape(Circle())
                                                            
                                                            .overlay {
                                                                // Check if insignia is in `insigniasObtenidas` for this `visita`
                                                                let isCompleted = insigniasObtenidas.contains {
                                                                    $0.id == insignia.id && $0.visitaId == visita.id
                                                                }
//                                                                .overlay(
                                                                        // Conditional grayish overlay
                                                                !isCompleted
                                                                    ? Circle().fill(Color.black.opacity(0.3))
                                                                    : Circle().fill(Color.clear)
//                                                                    )
                                                                Circle()
                                                                    .stroke(isCompleted ? Color(hex: zona.color) : Color.gray, lineWidth: 5)
                                                            }
                                                    } placeholder: {
                                                        ProgressView()
                                                            .frame(width: 80, height: 80)
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
                            .frame(width: 360)
                            .shadow(color: Color.black.opacity(0.5), radius: 5, x: 4, y: 4)
                            
                            // Fotos section
                            VStack {
                                Text("Fotos")
                                    .font(Font.custom("VagRoundedBold", size: 20))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                ScrollView(.horizontal, showsIndicators: true) {
                                    HStack(spacing: 40) {
                                        ForEach(Array(sortedFotos.enumerated()), id: \.1.id) { index, foto in
                                            NavigationLink {
//                                                if let imageData = foto.imagen, let image = UIImage(data: imageData) {
//                                                    PhotoView(zonaColor: Color(hex: zona.color), zonaName: zona.nombre, foto: foto, index: index + 1, selectedImage: image)
//                                                } else {
                                                    PhotoView(zonaColor: Color(hex: zona.color), zonaName: zona.nombre, foto: foto, index: index + 1)
//                                                }
                                            } label: {
                                                if let imageData = foto.imagen, let image = UIImage(data: imageData) {
                                                    Image(uiImage: image)
                                                        .resizable()
                                                        .frame(width: 80, height: 80)
                                                        .clipShape(Circle())
                                                        .overlay {
                                                            Circle()
                                                                .stroke(foto.completado ? Color(hex: zona.color) : Color.gray, lineWidth: 5)
                                                        }
                                                } else {
                                                    Image(systemName: "photo.circle")
                                                        .resizable()
                                                        .aspectRatio(contentMode: .fit)
                                                        .frame(width: 80, height: 80)
                                                        .foregroundColor(.gray)
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
                            .frame(width: 360)
                            .shadow(color: Color.black.opacity(0.5), radius: 5, x: 4, y: 4)
                            Spacer()
 
                        }
                        .padding()
                        .multilineTextAlignment(.center)
                    }
                    .background(Color(red: 240/255, green: 244/255, blue: 248/255))
                    .padding(.top, 30)
                )
        }
    }
}

#Preview {
    let sampleZona = Zona(
        id: 1,
        nombre: "Pertenezco",
        descripcion: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In facilisis dapibus lectus vel lacinia. Ut viverra elit quis nibh pharetra interdum. Nullam dapibus, dolor vel faucibus consequat, metus magna auctor nulla, in tincidunt arcu eros ut nisi.",
        color: "#C4D600",
        logo: "Pertenezco"
    )
    let sampleExhibition = [Exhibicion(
        id: 1,
        idZona: 1,
        nombre: "Exhibición de Arte Moderno",
        descripcion: "Una colección de obras de arte moderno de varios artistas.",
        completado: false,
        imagen: "https://drive.google.com/uc?id=1UGgzWVKqQ6vK6YSGOaUCTTNIkFMb2NPf",
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
        idNFC: "1"
    )]
    let samplePhoto = [Foto(
        id: 1,
        idZona: 1,
        idVisita: 1,
        imagen: nil,
        completado: false
    )]
    ZoneView(zona: sampleZona, exhibiciones: sampleExhibition, insignias: sampleInsignia, fotos: samplePhoto, visita: Visita(id: 1, date: Date(), orden: "Pertenezco Comunico Comprendo Soy Expreso Pequeño"))
        .modelContainer(for: [Zona.self, InsigniaObtenida.self, Insignia.self, Evento.self, Visita.self, Foto.self, Exhibicion.self, ExhibicionObtenida.self, FetchedDate.self], inMemory: true)
}
