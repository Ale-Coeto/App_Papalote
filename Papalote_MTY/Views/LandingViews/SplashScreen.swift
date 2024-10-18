//
//  SplashScreen.swift
//  Papalote_MTY
//
//  Created by José Guerrero  on 18/10/24.
//

import SwiftUI

struct SplashScreen: View {
    
    @State private var scale: CGFloat = 1.0
    
    var body: some View {
        ZStack {
            LinearGradient(
                    gradient: Gradient(colors: [Color(hex: "#8DE049"), Color(hex: "#12D354")]),
                    startPoint: .leading,
                    endPoint: .trailing
                )
                .ignoresSafeArea()
            
            Image(uiImage: UIImage(named: "PapaloteMTYBlanco") ?? UIImage())
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 300, height: 300)
                .scaleEffect(scale)
                .onAppear {
                    withAnimation(
                        Animation.linear(duration: 1).repeatForever(autoreverses: true)
                    ) {
                        scale = 1.1
                    }
                }
        }
    }
}

#Preview {
    SplashScreen()
}
