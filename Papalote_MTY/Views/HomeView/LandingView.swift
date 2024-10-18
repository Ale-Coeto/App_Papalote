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
                    .font(.system(size: 48, weight: .bold, design: .rounded))
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
