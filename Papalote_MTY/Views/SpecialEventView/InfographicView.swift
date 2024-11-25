//
//  InfographicView.swift
//  Papalote_MTY
//
//  Created by Rodrigo Garcia on 25/10/24.
//

import SwiftUI
import SwiftData
struct InfographicView: View {
    let evento: Evento
    let visita: Visita
    @Query private var linkToImages: [LinkToImage]
    
    var body: some View {
        ScrollView {
            if let imageData = linkToImages.first(where: { $0.link == evento.imagen })?.imagen,
               let uiImage = UIImage(data: imageData) {
                Image(uiImage: uiImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity)
                    .padding()
            } else{
                AsyncImage(url: URL(string: evento.imagen)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: .infinity)
                } placeholder: {
                    ProgressView()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
                .padding()
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    InfographicView(evento: Evento(id: 1, fechaInicio: Date(), fechaFin: Date(), nombre: "Semana Cosmica", descripcion: "día del espacio", imagen: "https://d20ohkaloyme4g.cloudfront.net/img/document_thumbnails/a0b8d1f7b02a075564ed58d2c9a31d9d/thumb_1200_3000.png"), visita: Visita(id: 1, date: Date(), orden: "Pertenezco Comunico Comprendo Soy Expreso Pequeño"))
}
