//
//  NFCUnblockView.swift
//  Papalote_MTY
//
//  Created by José Guerrero  on 05/11/24.
//

import SwiftUI
import SwiftData
import SimpleToast

struct NFCUnblockView: View {
    @StateObject var NFCR = NFCReader()
    @StateObject var tagsList = NFCTagsList()
    @State private var hasAccess = false
    let visita: Visita
    @State var Tag: NFCTag = NFCTag(id: 0, tagName: "", date: nil, scanned: false)
    
    @State private var showToast = false
    @State private var toastMessage = ""
    @State private var isCorrect = false
    
    private let toastOptions = SimpleToastOptions(
        hideAfter: 3,
        animation: .bouncy
    )

    var body: some View {
        NavigationStack {
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
                            // Create the NFCTag object using the current date and changing the scanned value to true
                            Tag = NFCTag(id: tag.id, tagName: tag.tagName, date: Date(), scanned: false)
                            tagsList.addTag(Tag)
                            
                            // Check if the Tag.id is equal to 1
                            if Tag.id == 1 {
                                // Send Entrance time to web
                                Task {
                                    do {
                                        try await sendMuseumEntranceRequest(isEntrance: true)
                                    } catch {
                                        print("Failed to send MuseumEntrance request: \(error)")
                                    }
                                }
                                // Show success toast
                                toastMessage = "Tag escaneado correctamente"
                                isCorrect = true
                                
                            } else {
                                // Show error toast
                                toastMessage = "Tag incorrecto"
                                isCorrect = false
                            }
                            showToast = true
                            hideToastAfterDelay()
                            updateScannedState(for: Tag)
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
                    Button {
                        NFCR.startReading { tag in
                            // Create the NFCTag object using the current date and changing the scanned value to true
                            Tag = NFCTag(id: tag.id, tagName: tag.tagName, date: Date(), scanned: false)
                            tagsList.addTag(Tag)
                            
                            // Check if the Tag.id is equal to 1
                            if Tag.id == 1 {
                                // Send Entrance time to web
                                Task {
                                    do {
                                        try await sendMuseumEntranceRequest(isEntrance: true)
                                    } catch {
                                        print("Failed to send MuseumEntrance request: \(error)")
                                    }
                                }
                                // Show success toast
                                toastMessage = "Tag escaneado correctamente"
                                isCorrect = true
                                
                            } else {
                                // Show error toast
                                toastMessage = "Tag incorrecto"
                                isCorrect = false
                            }
                            showToast = true
                            hideToastAfterDelay()
                            updateScannedState(for: Tag)
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
                    Button("Saltar") {
                        updateScannedState(for: Tag)
                    }
                    Spacer()
                }
                .navigationDestination(isPresented: $Tag.scanned) {
                    StartQuizView(visita: visita)
                }
            }
            .navigationBarBackButtonHidden(true)
        }
        .simpleToast(isPresented: $showToast, options: toastOptions) {
            Label(toastMessage, systemImage: isCorrect ? "checkmark.circle" : "xmark.circle")
                .padding()
                .background(isCorrect ? Color.green : Color.red)
                .foregroundColor(Color.white)
                .cornerRadius(10)
        }
    }
    
    private func hideToastAfterDelay() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
            withAnimation {
                showToast = false
            }
        }
    }
    
    private func updateScannedState(for tag: NFCTag) {
        // This method is used to trigger a state update
        Tag = NFCTag(id: tag.id, tagName: tag.tagName, date: tag.date, scanned: true)
    }
}

#Preview {
    NFCUnblockView(visita: Visita(id: 1, date: Date(), orden: "Pertenezco Comunico Comprendo Soy Expreso Pequeño"))
}
