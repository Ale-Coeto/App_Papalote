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
    @State var Tag: NFCTag = NFCTag(id: 0, tagName: "", date: nil, scanned: false)
    

    var body: some View {
        NavigationStack{
            ZStack {
                Color.AppColors.FondoAzulClaro
                    .ignoresSafeArea()
                VStack {
                    Text("¡Aquí comienza la aventura!")
                        .font(Font.custom("VagRoundedBold", size: 30))
                        .foregroundStyle(Color.AppColors.AzulPapalote)
                        .padding(.top, 35)
                        .padding()
                        .padding(.bottom, -15)
                    
                    Spacer()
                    // Butterfly button to start scanning
                    Button {
                        NFCR.startReading { tag in
                            //Create the NFCTag object using the current date and changing the scanned value to true
                            
                            //Date() gets the correct date and time but time is in UTC
                            Tag = NFCTag(id: tag.id, tagName: tag.tagName, date: Date(), scanned: true)
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
                    Spacer()
                    Text("¿Ya encontraste la mariposa dentro del museo? Acerca el movil a ella y haz click en escanear para desbloquear tu aventura.")
                        .font(Font.custom("VagRounded-Light", size: 20))
                        .padding()
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: .infinity)
                    Spacer()
                    // Escanear button to start scanning
                    Button{
                        NFCR.startReading { tag in
                            //Create the NFCTag object using the current date and changing the scanned value to true
                            
                            //Date() gets the correct date and time but time is in UTC
                            Tag = NFCTag(id: tag.id, tagName: tag.tagName, date: Date(), scanned: true)
                        }
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 20)
                                .frame(width: 250, height: 80)
                                .padding()
                                .foregroundStyle(Color.AppColors.VerdePapalote)
                            Text("Escanear")
                                .font(Font.custom("VagRoundedBold", size: 30))
                                .foregroundStyle(Color.white)
                        }
                    }
                    Spacer()
                }
                .navigationDestination(isPresented: $Tag.scanned) {
                    StartQuizView(visita: visita)
                }
            }
        }
    }
}

#Preview {
    NFCUnblockView(visita: Visita(id: 1, date: Date(), orden: "Pertenezco Comunico Comprendo Soy Expreso Pequeño"))
}
