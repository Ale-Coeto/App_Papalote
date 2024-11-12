//  PhotosView.swift
//  Papalote_MTY
//
//  Created by Rodrigo Garcia on 26/10/24.
//

import SwiftUI
import SwiftData
import UIKit
import Photos

struct PhotosView: View {
    let visita: Visita
    @Query var photos: [Foto]
    @Query var zonas: [Zona]
    
    // State variable to track the selected photo
    @State private var selectedPhotoId: Int = 0
    @State private var isShareSheetPresented: Bool = false
    @State private var selectedPhotoImage: UIImage? = nil
    @State private var selectedPhotoZone: String = ""
    
    var body: some View {
        VStack {
            HomeLayoutView(title: "Àlbum de fotos")
                .overlay(
            ScrollView {
                LazyVGrid(columns: [
                    GridItem(.flexible(minimum: 100, maximum: 200), spacing: 8),
                    GridItem(.flexible(minimum: 100, maximum: 200), spacing: 8),
                    GridItem(.flexible(minimum: 100, maximum: 200), spacing: 8)
                ], spacing: 8) {
                    // Filter and display images
                    ForEach(photos.filter { $0.imagen != nil && $0.idVisita == visita.id }
                        .sorted(by: { $0.idZona < $1.idZona })) { photo in
                            if let imageData = photo.imagen, let uiImage = UIImage(data: imageData) {
                                // Display the image without rounded corners
                                Image(uiImage: uiImage)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .clipped()
                                    .shadow(radius: 5)
                                    .onTapGesture {
                                        // Set the selected photo, zone, and present the share sheet
                                        selectedPhotoImage = uiImage
                                        selectedPhotoId = photo.id
                                        selectedPhotoZone = getZoneName(for: photo.idZona) // Get the zone name
                                        isShareSheetPresented = true
                                    }
                            }
                        }
                }
                .padding(8)
            }
                .padding(.top, 40)
                )
        }
        .sheet(isPresented: Binding<Bool>(
            get: { isShareSheetPresented && selectedPhotoImage != nil },
            set: { newValue in if !newValue { isShareSheetPresented = false } }
        )) {
            // Sheet content for sharing
            if let imageToShare = selectedPhotoImage {
                ShareSheetView(image: imageToShare, zone: selectedPhotoZone, zoneColor: getZoneColor(for: selectedPhotoId))
            }
        }
        .background(Color(UIColor.systemGray6))
        .edgesIgnoringSafeArea(.bottom)
    }
    
    // Function to get the zone name from idZona
    private func getZoneName(for idZona: Int) -> String {
        // Find the zone with the matching idZona
        if let zona = zonas.first(where: { $0.id == idZona }) {
            return zona.nombre
        } else {
            return "Zona desconocida"
        }
    }
    
    // Function to get the zone color from the photo ID
    private func getZoneColor(for idPhoto: Int) -> Color {
        // Find the photo with the matching idPhoto
        if let photo = photos.first(where: { $0.id == idPhoto }) {
            // Get zone ID from the photo
            let idZona = photo.idZona
            if let zona = zonas.first(where: { $0.id == idZona }) {
                return Color(hex: zona.color) // Convert hex to Color
            }
        }
        return Color.white
    }
    
}

// Modifica ShareSheetView para usar UIActivityViewController
struct ShareSheetView: View {
    let image: UIImage
    let zone: String
    let zoneColor: Color
    
    @Environment(\.presentationMode) var presentationMode
    @State private var isActivityViewPresented = false
    
    var body: some View {
        VStack(spacing: 16) {
            // Título en la parte superior
            Text("Foto tomada en \(zone)")
                .font(Font.custom("VagRoundedBold", size: 48))
                .fontWeight(.bold)
                .padding(.top)
            
            Spacer() // Espacio entre el título y la imagen
            
            Image(uiImage: image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 300)
                .padding()
                .background(zoneColor)
                .cornerRadius(12)
                .shadow(radius: 10)
            
            Button(action: {
                // Abre el ActivityViewController
                isActivityViewPresented = true
            }) {
                Text("Compartir")
                    .font(Font.custom("VagRoundedBold", size: 24))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.horizontal, 40)
                    .padding(.vertical, 15)
                    .background(zoneColor)
                    .cornerRadius(20)
                    .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
            }
            .padding(.top, 20)
            .sheet(isPresented: $isActivityViewPresented) {
                ActivityViewController(activityItems: [image])
                    .presentationDetents([.medium, .large])
            }


            Spacer()
        }
        .padding()
        .background(.white)
        .cornerRadius(20)
        .padding(.horizontal)
    }
}

// Wrapper para UIActivityViewController
struct ActivityViewController: UIViewControllerRepresentable {
    var activityItems: [Any]
    var applicationActivities: [UIActivity]? = nil

    func makeUIViewController(context: Context) -> UIActivityViewController {
        let controller = UIActivityViewController(activityItems: activityItems, applicationActivities: applicationActivities)
        return controller
    }

    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {}
}


#Preview {
    PhotosView(visita: Visita(id: 1, date: Date(), orden: "Pertenezco, Comunico, Comprendo, Soy, Expreso, Pequeño"))
}
