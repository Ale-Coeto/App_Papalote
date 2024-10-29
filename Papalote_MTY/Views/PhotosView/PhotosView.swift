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

// View for sharing the photo
struct ShareSheetView: View {
    let image: UIImage
    let zone: String
    let zoneColor: Color
    
    var body: some View {
        VStack(spacing: 16) {
            // Title at the top
            Text("Foto tomada en \(zone)")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top)
            
            Spacer() // Add space between the title and the image
            
            Image(uiImage: image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 300)
                .padding()
                .background(zoneColor)
                .cornerRadius(12)
                .shadow(radius: 10)
            
            if InstagramSharingUtils.canOpenInstagramStories {
                Button(action: {
                    InstagramSharingUtils.shareToInstagramStories(image)
                }) {
                    Text("Compartir en Instagram Stories")
                        .fontWeight(.bold)
                        .padding()
                        .frame(maxWidth: .infinity) // Full width
                        .background(
                            LinearGradient(gradient: Gradient(colors: [Color(red: 0.95, green: 0.25, blue: 0.56), Color(red: 0.25, green: 0.47, blue: 0.93)]), startPoint: .leading, endPoint: .trailing) // Horizontal gradient
                        )
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.top, 20)
            } else {
                Text("Instagram no está disponible.")
                    .foregroundColor(.gray)
                    .padding(.top, 20)
            }
            
            Spacer()
        }
        .padding()
        .background(.white)
        .cornerRadius(20)
        .padding(.horizontal)
    }
}

#Preview {
    PhotosView(visita: Visita(id: 1, date: Date(), orden: "Pertenezco, Comunico, Comprendo, Soy, Expreso, Pequeño"))
}
