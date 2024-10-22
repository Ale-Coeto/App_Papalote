//
//  LandingView.swift
//  Papalote_MTY
//
//  Created by José Guerrero  on 15/10/24.
//

import SwiftUI

struct LandingView: View {
    var body: some View {
        NavigationStack{
        ZStack {
            ZStack {
                LoopingPlayerView(fileName: "PapaloteBackground")
                
                Color.black
                    .opacity(0.40)
            }
            .ignoresSafeArea()
            
            VStack {
                Spacer()
                Image(uiImage: UIImage(named: "PapaloteMTYBlanco") ?? UIImage())
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300, height: 300)
                Spacer()
                NavigationLink(destination: VisitsView()){
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .frame(width: 220, height: 58)
                            .foregroundStyle(Color.white)
                        Text("Comenzar")
                            .font(Font.custom("VagRoundedBold", size: 24))
                            .foregroundStyle(Color.init(hex: "#8DE049"))
                    }
                }
                .padding(.bottom, 90)
            }
        }
    }
    }
}

#Preview {
    LandingView()
}
