import SwiftUI

struct BadgeScrollView: View {
    var sectionName: String
    var insignias: [Insignia] // List of Insignia objects
    var isCompleted: [Bool] // Array to track if the badge is completed
    @Binding var showSheet: Bool

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            VStack(alignment: .leading) {
                Text(sectionName)
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(.gray)
                    .padding([.top, .leading, .trailing])
                
                ScrollView(.horizontal, showsIndicators: true) {
                    HStack(spacing: 15) {
                        ForEach(Array(insignias.enumerated()), id: \.element.id) { index, insignia in
                            Button(action: {
                                showSheet = true
                            }) {
                                // Async image for insignia image URL
                                AsyncImage(url: URL(string: insignia.imagen)) { phase in
                                    if let image = phase.image {
                                        image
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 50, height: 50)
                                            .background(Color.white)
                                            .clipShape(Circle())
                                            .overlay(
                                                // Overlay with conditional border based on isCompleted
                                                Circle().stroke(isCompleted[index] ? Color.green : Color.gray, lineWidth: 3.5) 
                                            )
                                            .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
                                            .padding(8)
                                    } else {
                                        Circle()
                                            .fill(Color.gray.opacity(0.5))
                                            .frame(width: 50, height: 50)
                                    }
                                }
                            }
                            .sheet(isPresented: $showSheet) {
                                BadgeView(insignia: insignia)
                            }
                        }
                    }
                    .padding(.horizontal)
                }
                .frame(height: 80)
            }
            .background(Color.white)
            .cornerRadius(12)
            .shadow(color: Color.black.opacity(0.1), radius: 8, x: 0, y: 4)
        }
        .padding(.horizontal)
        .padding(.bottom, 10)
    }
}

#Preview {
    BadgeScrollView(
        sectionName: "Sample Section",
        insignias: [
            Insignia(id: 1, idZona: 1, idEvento: 1, nombre: "Eco Guerrero", imagen: "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png", descripcion: "Insignia por promover acciones ecológicas", completado: false, idNFC: 1),
            Insignia(id: 2, idZona: 1, idEvento: 1, nombre: "Protector del Bosque", imagen: "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png", descripcion: "Insignia por proteger los recursos naturales", completado: false, idNFC: 1),
            Insignia(id: 3, idZona: 1, idEvento: 1, nombre: "Amigo de la Tierra", imagen: "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png", descripcion: "Insignia por cuidar la biodiversidad", completado: false, idNFC: 1),
            Insignia(id: 4, idZona: 1, idEvento: 1, nombre: "Héroe Sustentable", imagen: "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png", descripcion: "Insignia por promover la sustentabilidad", completado: false, idNFC: 1)
        ],
        isCompleted: [true, false, true, false],
        showSheet: .constant(false)
    )
}
