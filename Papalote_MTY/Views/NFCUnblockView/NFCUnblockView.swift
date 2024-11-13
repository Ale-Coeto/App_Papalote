//
//  NFCUnblockView.swift
//  Papalote_MTY
//
//  Created by José Guerrero  on 05/11/24.
//

import SwiftUI
import SwiftData

struct NFCUnblockView: View {
    @StateObject var reader = NFCReader()
    let visita: Visita

    var body: some View {
        ZStack {
            Color.AppColors.FondoAzulClaro
                .ignoresSafeArea()
            VStack {
                Text("Desbloqueemos la aplicación")
                    .font(Font.custom("VagRoundedBold", size: 30))
                    .foregroundStyle(Color.AppColors.AzulPapalote)
                    .padding(.top, 35)
                    .padding()
                    .padding(.bottom, -15)
                Spacer()
                Button {
                    self.reader.startReading()
                } label: {
                    if let filePath = Bundle.main.path(forResource: "LogoPapaloteVerde", ofType: "png"),
                       let uiImage = UIImage(contentsOfFile: filePath) {
                        Image(uiImage: uiImage)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 250)
                    }
                }
                if let tagData = reader.tagData {
                    Text("Tag Data: \(tagData.hexEncodedString())")
                } else {
                    Text("No tag data")
                }
                Text("Presiona la mariposa para iniciar escaner NFC")
                    .font(Font.custom("VagRounded-Light", size: 18))
                    .padding(.top, -5)
                Spacer()
                Spacer()
            }
        }
    }
}

extension Data {
    func hexEncodedString() -> String {
        return map { String(format: "%02hhx", $0) }.joined()
    }
}

#Preview {
    NFCUnblockView(visita: Visita(id: 1, date: Date(), orden: "Pertenezco Comunico Comprendo Soy Expreso Pequeño"))
}
