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
    @Query private var linkToImages: [LinkToImage]
    @State private var shouldNavigateArray: [Bool] = Array(repeating: false, count: 100)
    let visita: Visita
    @StateObject var viewModel = HomeViewModel()
    @State private var currentIndex = 0
    @State private var dragOffset: CGFloat = 0
    @State private var shouldNavigate = false
    @State private var selectedEventIndex: Int? = nil
        var body: some View {
        // Use the sorting function from ZonaSorting.swift
        let sortedZonas = sortZonasByOrden(zonas: zonas, orden: visita.orden)
            
            let sortedEventos = eventosEspeciales.sorted {
                if $0.fechaInicio == $1.fechaInicio {
                    return $0.id < $1.id
                }
                return $0.fechaInicio < $1.fechaInicio
            }
            
        NavigationStack {
            HomeLayoutView(title: "Papalote MTY")
                .overlay(
                    VStack {
                        ZStack {
                            ForEach(0..<sortedEventos.count, id: \.self) { index in
                                ZStack {
                                    // Main Card Content
                                    VStack {
                                        Text("Evento de tiempo Limitado!")
                                            .font(Font.custom("VagRounded-Light", size: 18))
                                            .foregroundColor(.gray)
                                        Text(sortedEventos[index].nombre)
                                            .font(Font.custom("VagRounded-Light", size: 22))
                                            .bold()
                                            .foregroundColor(.black)
                                        Text(sortedEventos[index].descripcion)
                                            .font(Font.custom("VagRounded-Light", size: 16))
                                            .foregroundColor(.gray)
                                        Text("Solo disponible hasta \(formattedDate(sortedEventos[index].fechaFin))")
                                            .font(Font.custom("VagRounded-Light", size: 14))
                                            .foregroundColor(.red)
                                            .padding(.top, 5)
                                    }
                                    .frame(width: 300, height: 140)
                                    .padding()
                                    .background(
                                        RoundedRectangle(cornerRadius: 10)
                                            .fill(Color.white)
                                            .shadow(radius: 5)
                                    )
                                    .opacity(currentIndex == index ? 1.0 : 0.5)
                                    .scaleEffect(currentIndex == index ? 1.0 : 0.8)
                                    .offset(x: CGFloat(index - currentIndex) * 320 + dragOffset, y: 0)
                                    .animation(.spring(), value: dragOffset)
                                    
                                    // Navigation handling
                                    NavigationLink(
                                        destination: SpecialEventView(evento: sortedEventos[currentIndex], visita: visita),
                                        isActive: $shouldNavigateArray[index]  // Bind each NavigationLink to the corresponding flag
                                    ) {
                                        EmptyView()
                                    }
                                }
                                .contentShape(Rectangle())
                                .onTapGesture {
                                    if currentIndex == index {
                                        shouldNavigateArray[index] = true
                                    } else {
                                        shouldNavigateArray[index] = true
                                    }
                                }
                            }
                        }
                        .gesture(
                            DragGesture()
                                .onChanged { value in
                                    shouldNavigateArray = Array(repeating: false, count: sortedEventos.count)  // Reset all navigation flags during drag
                                    dragOffset = value.translation.width
                                }
                                .onEnded { value in
                                    let threshold: CGFloat = 50
                                    withAnimation(.spring()) {
                                        if value.translation.width > threshold {
                                            currentIndex = max(currentIndex - 1, 0)
                                        } else if value.translation.width < -threshold {
                                            currentIndex = min(currentIndex + 1, sortedEventos.count - 1)
                                        }
                                        dragOffset = 0
                                    }
                                }
                        )
                        
                        
                        if (eventosEspeciales.isEmpty) {
                            VStack {
                                Text("Bienvenido a Museo Papalote")
                                    .fontWeight(.bold)
                                    .padding(.bottom, 10)
                                    
                                
                                Text("Selecciona una zona para ver más información o navega con el mapa.")
                                    
                            }
                            .padding(30)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.white)
                                    .shadow(radius: 5)
                            )
                            .padding(.bottom, 20)
                            
                            
                        }
                        
                        ScrollView{
                            VStack(spacing: 20) {
                                ForEach(sortedZonas, id: \.self.id) { zona in
                                    let filteredExhibicion = exhibiciones.filter { $0.idZona == zona.id }
                                    let filteredInsignias = insignias.filter { $0.idZona == zona.id }
                                    let filteredFotos = fotos.filter { $0.idVisita == visita.id && $0.idZona == zona.id }
                                    
                                    NavigationLink {
                                        ZoneView(zona: zona, exhibiciones: filteredExhibicion, insignias: filteredInsignias, fotos: filteredFotos, visita: visita)
                                    } label: {
                                        ZStack {
                                            RoundedRectangle(cornerRadius: 10)
                                                .fill(Color(hex: zona.color))
                                                .shadow(radius: 5)
                                                .frame(minHeight: 46, maxHeight: 46)
                                            HStack {
                                                Text(zona.nombre)
                                                    .font(Font.custom("VagRoundedBold", size: 22))
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
                                                            Group {
                                                                if let imageData = linkToImages.first(where: { $0.link == zona.logo })?.imagen,
                                                                   let uiImage = UIImage(data: imageData) {
                                                                    // Use the locally stored image from Core Data
                                                                    Image(uiImage: uiImage)
                                                                        .resizable()
                                                                        .aspectRatio(contentMode: .fit)
                                                                        .padding(10)
                                                                        .frame(width: 50)
                                                                } else if let localImage = UIImage(named: zona.logo) {
                                                                    // Use the local image from assets
                                                                    Image(uiImage: localImage)
                                                                        .resizable()
                                                                        .aspectRatio(contentMode: .fit)
                                                                        .padding(10)
                                                                        .frame(width: 50)
                                                                } else if let url = URL(string: zona.logo) {
                                                                    // Use the remote image with AsyncImage
                                                                    AsyncImage(url: url) { phase in
                                                                        switch phase {
                                                                        case .empty:
                                                                            ProgressView() // Show a loading indicator
                                                                        case .success(let image):
                                                                            image
                                                                                .resizable()
                                                                                .aspectRatio(contentMode: .fit)
                                                                                .padding(10)
                                                                                .frame(width: 50)
                                                                        case .failure:
                                                                            Image(systemName: "photo") // Fallback image
                                                                                .resizable()
                                                                                .aspectRatio(contentMode: .fit)
                                                                                .padding(10)
                                                                                .frame(width: 50)
                                                                        @unknown default:
                                                                            EmptyView()
                                                                        }
                                                                    }
                                                                } else {
                                                                    // Fallback for invalid paths
                                                                    Image(systemName: "photo")
                                                                        .resizable()
                                                                        .aspectRatio(contentMode: .fit)
                                                                        .padding(10)
                                                                }
                                                            }

                                                            // IT ENDED HERE
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                            .padding(.top, 0)
                            .padding()
                        }
                    }
                        .padding(.top, Constants.HEADER_HEIGHT - 40)
                        .padding()
                )
        }
        .onAppear {
            print("this is zonas before mock data manager")
            print(zonas)
            MockDataManager.addMockData(to: context)
            print("this is zonas after")
        }
    }
}
// Example EventDetailView for the destination
struct EventDetailView: View {
    let evento: Evento
    
    var body: some View {
        VStack {
            Text(evento.nombre)
                .font(Font.custom("VagRounded-Light", size: 34))
                .padding()
            Text(evento.descripcion)
                .font(Font.custom("VagRounded-Light", size: 18))
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
    HomeView(visita: Visita(id: 1, date: Date(), orden: "Pertenezco Comunico Comprendo Soy Pequeños Expreso"))
        .modelContainer(for: [Zona.self, InsigniaObtenida.self, Insignia.self, Evento.self, Visita.self, Foto.self, Exhibicion.self, FetchedDate.self], inMemory: true)
}


