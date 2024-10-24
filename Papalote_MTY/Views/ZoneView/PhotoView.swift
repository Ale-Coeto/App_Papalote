//
//  BadgeView.swift
//  Reto
//
//  Created by Oscar Zhao Xu on 17/10/24.
//

import SwiftUI

struct PhotoView: View {
    @Environment(\.modelContext) private var context
    @State private var selectedImage: UIImage?
    @State private var showCamera = false
    @State private var showAlert = false
    let foto: Foto
    
    var body: some View {
        VStack(spacing: 20) {
            if let image = selectedImage {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200)
                    .padding()
            } else {
                Image(systemName: "photo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200)
                    .foregroundColor(.gray) 
                    .padding()
            }
            
            
            Button {
                showCamera.toggle()
            } label: {
                Text("Tomar foto")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.horizontal, 40)
                    .padding(.vertical, 15)
                    .background(foto.completado ? Color.green : Color.gray)
                    .cornerRadius(20)
                    .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
            }
            .padding(.bottom, 20)
            .sheet(isPresented: $showCamera, onDismiss: checkImageSelection) {
                CameraPickerView(selectedImage: $selectedImage).ignoresSafeArea()
            }
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("Error"),
                    message: Text("No se ha tomado ninguna foto"),
                    dismissButton: .default(Text("OK"))
                )
            }
        }
        .padding()
        .padding(.horizontal)
    }
    private func checkImageSelection() {
        if let selectedImage = selectedImage {
            foto.completado.toggle()
            savePhotoToDatabase(photo: selectedImage)
        } else {
            showAlert = true
        }
    }
    func savePhotoToDatabase(photo: UIImage) {
        guard let data = photo.pngData() else { return }
        foto.imagen = data
        do {
            try context.save()
        } catch {
            print("Error saving photo to database: \(error)")
            showAlert = true
        }
    }
}

#Preview {
    let samplePhoto = Foto(
        id: 1,
        idZona: 1,
        idVisita: 1,
        imagen: nil,
        completado: false
    )
    PhotoView(foto: samplePhoto)
}

