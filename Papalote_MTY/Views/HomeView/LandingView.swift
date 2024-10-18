//
//  LandingView.swift
//  Papalote_MTY
//
//  Created by José Guerrero  on 15/10/24.
//

import SwiftUI

func viewFonts() {
        for family in UIFont.familyNames {
            print(family)
            for name in UIFont.fontNames(forFamilyName: family) {
                print(name)
            }
        }
    }

struct LandingView: View {
    var body: some View {
        ZStack {
            
            ZStack {
                LoopingPlayerView(fileName: "PapaloteBackground")
                
                Color.black
                    .opacity(0.40)
            }
            .ignoresSafeArea()
            
            VStack {
                Text("Bienvenido a Papalote Museo Del Niño")
                    .font(Font.custom("VagRounded-Light", size: 50))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .shadow(radius: 20)
                    .padding()
                
                Text("Bienvenido a Papalote Museo Del Niño")
                    .font(Font.custom("VagRoundedBold", size: 50))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .shadow(radius: 20)
            }
            .onAppear{
                viewFonts()
            }
        }
    }
}

#Preview {
    LandingView()
}
