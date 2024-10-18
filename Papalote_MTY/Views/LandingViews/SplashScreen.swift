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
            Color(hex: "#8DE049")
            
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
        .ignoresSafeArea()
    }
}

#Preview {
    SplashScreen()
}
