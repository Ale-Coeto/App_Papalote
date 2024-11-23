//
//  StartQuizView.swift
//  Papalote_MTY
//
//  Created by José Guerrero  on 25/10/24.
//

import SwiftUI
import SimpleToast

struct StartQuizView: View {
    @State var isAlertOn: Bool = false
    let visita: Visita
    @State var isSkipping: Bool = false
    
    @State var showToast: Bool = true
        
        private let toastOptions = SimpleToastOptions(
            hideAfter: 3,
            animation: .bouncy
        )
    
    var body: some View {
        NavigationStack{
        ZStack{
            Color.AppColors.FondoAzulClaro
            VStack{
                Spacer()
                Spacer()
                ZonasLogos()
                Text("¿Qué zona de Papalote Museo del Niño Monterrey eres?")
                    .font(Font.custom("VagRoundedBold", size: 30))
                    .foregroundStyle(Color.AppColors.AzulPapalote)
                    .multilineTextAlignment(.center)
                    .padding()
                Spacer()
                NavigationLink(destination: QuizView(visita: visita)) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .frame(width: 350, height: 80)
                            .padding()
                            .foregroundStyle(Color.AppColors.VerdePapalote)
                        Text("Empezar encuesta")
                            .font(Font.custom("VagRoundedBold", size: 30))
                            .foregroundStyle(Color.white)
                    }
                }
                Button {
                    isAlertOn = true
                } label:{
                    ZStack{
                        Text("Saltar encuesta")
                            .font(Font.custom("VagRoundedBold", size: 14))
                            .foregroundStyle(Color.init(hex: "#8D9193"))
                            .underline()
                    }
                    
                }
                .padding(.top, -20)
                .padding(.bottom, 70)
            }

        }.ignoresSafeArea()
            .alert(isPresented: $isAlertOn) {
                        Alert(
                title: Text("¿Quieres saltar la encuesta?"),
                message: Text("Ya no podrás hacer la encuesta en otra ocasión."),
                primaryButton: .destructive(Text("Saltar encuesta"), action: {
                    visita.orden = "Pertenezco Comunico Comprendo Soy Expreso Pequeño"
                    isSkipping = true
                }),
                secondaryButton: .default(Text("Regresar"))
                )
            }
            .navigationDestination(isPresented: $isSkipping) {
                MainView(visita: visita)
            }
            .simpleToast(isPresented: $showToast, options: toastOptions) {
                Label("Aplicación desbloqueada", systemImage: "checkmark.circle")
                    .padding()
                    .background(Color.green)
                    .foregroundColor(Color.white)
                    .cornerRadius(10)
                    .padding(.top, 30)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
    
    private func hideToastAfterDelay() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
            withAnimation {
                showToast = false
            }
        }
    }

}








struct ZonasLogos: View {
    var body: some View {
        VStack (spacing: 10){
            HStack{
                if let filePath = Bundle.main.path(forResource: "comprendo", ofType: "png"),
                   let uiImage = UIImage(contentsOfFile: filePath) {
                    Image(uiImage: uiImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width:50)
                } else {
                    Text("Image not found")
                }
                
                if let filePath = Bundle.main.path(forResource: "comunico", ofType: "png"),
                   let uiImage = UIImage(contentsOfFile: filePath) {
                    Image(uiImage: uiImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width:50)
                    
                } else {
                    Text("Image not found")
                }
                
                if let filePath = Bundle.main.path(forResource: "expreso", ofType: "png"),
                   let uiImage = UIImage(contentsOfFile: filePath) {
                    Image(uiImage: uiImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width:50)
                } else {
                    Text("Image not found")
                }
            }
            HStack{
                if let filePath = Bundle.main.path(forResource: "pequeños", ofType: "png"),
                   let uiImage = UIImage(contentsOfFile: filePath) {
                    Image(uiImage: uiImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width:50)
                } else {
                    Text("Image not found")
                }
                
                if let filePath = Bundle.main.path(forResource: "pertenezco", ofType: "png"),
                   let uiImage = UIImage(contentsOfFile: filePath) {
                    Image(uiImage: uiImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width:50)
                } else {
                    Text("Image not found")
                }
                
                if let filePath = Bundle.main.path(forResource: "soy", ofType: "png"),
                   let uiImage = UIImage(contentsOfFile: filePath) {
                    Image(uiImage: uiImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width:50)
                } else {
                    Text("Image not found")
                }
            }
        }
    }
}


#Preview {
    StartQuizView(visita: Visita(id: 1, date: Date(), orden: "Pertenezco Comunico Comprendo Soy Expreso Pequeño"))
}
