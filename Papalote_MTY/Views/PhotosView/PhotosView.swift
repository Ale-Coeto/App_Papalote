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
                    GridItem(.flexible(minimum: 100, maximum: 110), spacing: 20),
                    GridItem(.flexible(minimum: 100, maximum: 110), spacing: 20),
                    GridItem(.flexible(minimum: 100, maximum: 110), spacing: 20)
                ], spacing: 20) {
                    // Filter and display images
                    
                    ForEach(photos.filter { $0.imagen != nil && $0.idVisita == visita.id }.sorted(by: { $0.idZona < $1.idZona })) { photo in
                            if let imageData = photo.imagen, let uiImage = UIImage(data: imageData),
                               let zona = zonas.first(where: { $0.id == photo.idZona })
                               
                            {
                                let zoneColor = Color(hex: zona.color)
                                Image(uiImage: uiImage)
                                    //.background(.black)
                                    .resizable()
                                    //.aspectRatio(contentMode: .fill)
                                    .clipped()
                                    .overlay(           // Use overlay for the border with rounded corners
                                            RoundedRectangle(cornerRadius: 8)
                                                .stroke(zoneColor, lineWidth: 10)  // Border color and width
                                        )
                                    .aspectRatio(contentMode: .fill)
                                    .shadow(radius: 2)
                                    //.shadow(radius: 5)
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
                .padding(.top, 50)
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
    
    @State private var isActivityViewPresented = false
    
    @State var borderedImage: UIImage?
    
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            Text("Foto tomada en \(zone)")
                .font(Font.custom("VagRoundedBold", size: 40))
                .fontWeight(.bold)
                .padding(.top)

            //Spacer()
            Divider()
                .frame(minHeight: 5)
                .background(zoneColor)
            
            if let borderedImage = borderedImage{
                Image(uiImage: borderedImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 300)
                    .padding()
                    //.background(zoneColor)
                    //.cornerRadius(12)
                    //.shadow(radius: 10)
            }

            Button(action: {
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
                // Convert the UIImage to JPEG data
                if let jpegData = borderedImage?.jpegData(compressionQuality: 0.8) {
                    ActivityViewController(activityItems: [jpegData])
                        .presentationDetents([.medium, .large])
                }
            }

            Spacer()
        }
        .padding()
        .background(.white)
        .cornerRadius(20)
        .padding(.horizontal)
        .onAppear{
            borderedImage = addBorderToImage(image, zonaColor: zoneColor, zona: zone)
        }
    }
}






import SwiftUI
import UIKit
/*
struct ShareSheetView: View {
    let image: UIImage
    let zone: String
    let zoneColor: Color
    
    @Environment(\.presentationMode) var presentationMode
    @State private var isActivityViewPresented = false
    
    // Method to share the image (JPEG conversion included)
    func shareImageViaWhatsApp(image: UIImage) {
        // Convert the UIImage to JPEG data
        if let imageData = image.jpegData(compressionQuality: 1.0) {
            // Create the items array with the JPEG data
            let items: [Any] = [imageData]
            
            // Create the UIActivityViewController
            let ac = UIActivityViewController(activityItems: items, applicationActivities: nil)
            
            // Exclude certain activity types (optional)
            ac.excludedActivityTypes = [
                UIActivity.ActivityType.print,
                UIActivity.ActivityType.postToWeibo,
                UIActivity.ActivityType.copyToPasteboard,
                UIActivity.ActivityType.addToReadingList,
                UIActivity.ActivityType.postToVimeo
            ]
            
            // Present the activity view controller
            if let rootVC = UIApplication.shared.windows.first?.rootViewController {
                rootVC.present(ac, animated: true)
            }
        } else {
            print("Failed to convert image to JPEG data")
        }
    }

    var body: some View {
        //let imageWithBorder = image
        /*addBorderToImage(image, borderColor: UIColor(zoneColor), borderWidth: 200, cornerRadius: 150)*/
        
        VStack(spacing: 16) {
            Text("Foto tomada en \(zone)")
                .font(Font.custom("VagRoundedBold", size: 48))
                .fontWeight(.bold)
                .padding(.top)
            
            Spacer()
            
            Image(uiImage: image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 300)
                .padding()
                .background(zoneColor)
                .cornerRadius(12)
                .shadow(radius: 10)
            
            Button(action: {
                // Call the share method when the button is pressed
                shareImageViaWhatsApp(image: image)
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

            Spacer()
        }
        .padding()
        .background(.white)
        .cornerRadius(20)
        .padding(.horizontal)
    }
}

*/




// Wrapper para UIActivityViewController
struct ActivityViewController: UIViewControllerRepresentable {
    var activityItems: [Any]
    var applicationActivities: [UIActivity]? = nil

    func makeUIViewController(context: Context) -> UIActivityViewController {
        print("did enter ActivityViewController")
        let controller = UIActivityViewController(activityItems: activityItems, applicationActivities: applicationActivities)
        return controller
    }

    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {}
}



/*struct ActivityViewController: UIViewControllerRepresentable {
    var activityItems: [Any]
    var applicationActivities: [UIActivity]? = nil

    func makeUIViewController(context: Context) -> UIActivityViewController {
        print("Entering ActivityViewController")
        let controller = UIActivityViewController(
            activityItems: activityItems,
            applicationActivities: applicationActivities
        )
        
        // Optional: Handle completion
        controller.completionWithItemsHandler = { (activityType, completed, returnedItems, error) in
            if let error = error {
                print("Share error: \(error.localizedDescription)")
            }
        }
        
        return controller
    }

    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {}
}*/

// In ShareSheetView
/*.sheet(isPresented: $isActivityViewPresented) {
    // Convert to CGImage or create a new UIImage to ensure compatibility
    if let cgImage = image.cgImage {
        let processedImage = UIImage(cgImage: cgImage)
        ActivityViewController(activityItems: [processedImage])
            .presentationDetents([.medium, .large])
    }
}*/






#Preview {
    PhotosView(visita: Visita(id: 1, date: Date(), orden: "Pertenezco, Comunico, Comprendo, Soy, Expreso, Pequeño"))
}
