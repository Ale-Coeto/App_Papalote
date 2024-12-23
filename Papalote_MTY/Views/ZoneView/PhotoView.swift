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
    var zonaColor : Color
    let zonaName: String
    let foto: Foto
    let index: Int

    private var fotoNumero: String {
        switch index % 3 {
        case 1:
            return "Foto 1"
        case 2:
            return "Foto 2"
        default:
            return "Foto 3"
        }
    }
    
    var body: some View {
        VStack(spacing: 20) {
            Text(fotoNumero)
                .font(Font.custom("VagRoundedBold", size: 40))
                .multilineTextAlignment(.center)
                .fontWeight(.bold)
                .padding(.top, 20)
            
            Divider()
                .frame(minHeight: 5)
                .background(zonaColor)
            
            if let image = foto.imagen, let imageui = UIImage(data: image) {
                Image(uiImage: imageui)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 250, height: 250)
                    .padding()
            } else {
                Image(systemName: "photo.circle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 280, height: 280)
                    .foregroundColor(.gray)
                    .padding()
            }
            
            Button {
                showCamera.toggle()
            } label: {
                Text("Tomar foto")
                    .font(Font.custom("VagRoundedBold", size: 24))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.horizontal, 40)
                    .padding(.vertical, 15)
                    .background(foto.completado ? Color(zonaColor) : Color.gray)
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
                    message: Text("Error al tomar la foto"),
                    dismissButton: .default(Text("OK"))
                )
            }
        }
        .padding()
        .padding(.horizontal)
//        .onAppear {
//            if let im = UIImage(data: foto.)
//        }
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
        //let borderedPhoto = addBorderToImage(photo, zonaColor: zonaColor, zona: zonaName)
        
        /*if let jpegData = borderedPhoto.jpegData(compressionQuality: 0.1) {
                print("JPEG Data Information:")
                print("Data length: \(jpegData.count) bytes")
                print("MIME type: image/jpeg")
                
                // Optional: print first few bytes as hex for deeper inspection
                let hexString = jpegData.prefix(20).map { String(format: "%02x", $0) }.joined()
                print("First 20 bytes (hex): \(hexString)")
                
                foto.imagen = jpegData
            } else {
                print("Failed to convert to JPEG")
            }
       // let borderedPhoto = photo
        if let jpegData = photo.jpegData(compressionQuality: 0.6) {
                print("JPEG Data Information 2:")
                print("Data length 2: \(jpegData.count) bytes")
                print("MIME type: image/jpeg")
                
                // Optional: print first few bytes as hex for deeper inspection
                let hexString = jpegData.prefix(20).map { String(format: "%02x", $0) }.joined()
                print("First 20 bytes (hex): \(hexString)")
                
                foto.imagen = jpegData
            } else {
                print("Failed to convert to JPEG")
            }*/
        
        guard let data = photo.jpegData(compressionQuality: 0.1) else { return }
        foto.imagen = data
        
        print("this is the data")
        print(data)
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
    PhotoView(zonaColor: Color.green, zonaName: "Pertenezco", foto: samplePhoto, index: 1)
}

