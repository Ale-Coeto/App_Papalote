//
//  NFCUnblockView.swift
//  Papalote_MTY
//
//  Created by José Guerrero  on 05/11/24.
//

import SwiftUI
import SwiftData

struct NFCUnblockView: View {
    @StateObject var NFCR = NFCReader()
    @State private var hasAccess = false
    let visita: Visita

    var body: some View {
        NavigationStack{
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
                        // Call NFC reader pop up and save data in var
                        NFCR.startReading { tagData in
                            print(tagData)
                            if tagData == "Hello world " {
                                print("SI EEEEEES")
                                hasAccess = true
                            }
                        }
                    } label: {
                        if let filePath = Bundle.main.path(forResource: "LogoPapaloteVerde", ofType: "png"),
                            let uiImage = UIImage(contentsOfFile: filePath) {
                            Image(uiImage: uiImage)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 250)
                        }
                    }
                    Text("Presiona la mariposa para iniciar escaner NFC")
                        .font(Font.custom("VagRounded-Light", size: 18))
                        .padding(.top, -5)
                    Spacer()
                    Spacer()
                }
                .navigationDestination(isPresented: $hasAccess) {
                    StartQuizView(visita: visita)
                }
            }
        }
    }
}

#Preview {
    NFCUnblockView(visita: Visita(id: 1, date: Date(), orden: "Pertenezco Comunico Comprendo Soy Expreso Pequeño"))
}
