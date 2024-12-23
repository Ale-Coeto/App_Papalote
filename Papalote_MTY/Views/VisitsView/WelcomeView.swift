//
//  WelcomeView.swift
//  Papalote_MTY
//
//  Created by Oscar Zhao Xu on 11/11/24.
//

import SwiftUI

struct WelcomeView: View {
    var visita: Visita
    @State private var shouldNavigate = false
    @State private var textAnimation = false
    
    var body: some View {
        ZStack{
            Color.AppColors.FondoAzulClaro
        VStack(spacing: 10) {
            Text("Bienvenido a")
                .font(Font.custom("VagRounded-Light", size: 26))
                .foregroundColor(Color.AppColors.AzulPapalote)
                .opacity(textAnimation ? 1 : 0)
                .scaleEffect(textAnimation ? 1 : 0.5)
                .padding(.bottom, 10)
                .animation(.easeOut(duration: 1.0).delay(0.5), value: textAnimation)
            
            Text("PAPALOTE • MUSEO DEL NIÑO")
                .font(Font.custom("VagRoundedBold", size: 28))
                .foregroundColor(Color.AppColors.VerdePapalote)
                .opacity(textAnimation ? 1 : 0)
                .scaleEffect(textAnimation ? 1 : 0.5)
                .animation(.easeOut(duration: 1.0).delay(1.0), value: textAnimation)
        }
        .multilineTextAlignment(.center)
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .onAppear {
            textAnimation = true
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                shouldNavigate = true
            }
        }
        .navigationDestination(isPresented: $shouldNavigate) {
            NFCUnblockView(visita: visita)
        }
        .navigationBarBackButtonHidden(true)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    WelcomeView(visita: Visita(id: 1, date: Date(), orden: ""))
}
