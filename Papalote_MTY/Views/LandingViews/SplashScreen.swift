//
//  SplashScreen.swift
//  Papalote_MTY
//
//  Created by José Guerrero  on 18/10/24.
//

import SwiftUI

struct SplashScreen<NextView: View>: View {
    
    @State private var scale: CGFloat = 1.0
    @State var isActive: Bool = false
    @State var splasherText: String
    
    let nextView: () -> NextView
    
    var body: some View {
        ZStack {
            if self.isActive{
                nextView()
            } else{
            LinearGradient(
                    gradient: Gradient(colors: [Color(hex: "#8DE049"), Color(hex: "#12D354")]),
                    startPoint: .leading,
                    endPoint: .trailing
                )
                .ignoresSafeArea()
                VStack{
                    Image(uiImage: UIImage(named: "PapaloteMTYBlanco") ?? UIImage())
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 300, height: 300)
                        .scaleEffect(scale)
                    
                    Text(splasherText)
                        .font(Font.custom("VagRounded-Light", size: 20))
                        .foregroundStyle(Color.white)
                        .padding()
                }
                .onAppear {
                    withAnimation(
                        Animation.linear(duration: 1).repeatForever(autoreverses: true)
                    ) {
                        scale = 1.1
                    }
                }
            }
        }
        .onAppear{
            //Harcoded load time
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                withAnimation {
                    self.isActive = true
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    SplashScreen(splasherText: "Welcome to Papalote MTY", nextView: { LandingView() })
        .modelContainer(for: [Zona.self, InsigniaObtenida.self, Insignia.self, Evento.self, Visita.self, Foto.self, Exhibicion.self, ExhibicionObtenida.self], inMemory: true)
}
