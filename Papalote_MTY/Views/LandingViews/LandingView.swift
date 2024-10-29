//
//  LandingView.swift
//  Papalote_MTY
//
//  Created by José Guerrero  on 15/10/24.
//

import SwiftUI

struct LandingView: View {
    // creo que esto se va a hacer en la visitsView
    // ahi es donde se crea la visita
    // como todavia no esta lo del quiz aqui voy a crear una visita y la voy a pasar a NavigationView
    // Para que ya la podamos usar, pero la visita que se
    // manda a navigation view se manda desde VisitsView
    
    let visita = Visita(id: 15, date: Date(), orden: "Pertenezco Comunico Comprendo Soy Expreso Pequeño")
    
    
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
                NavigationLink(destination: VisitsView()
                    ){
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
        .modelContainer(for: [Zona.self, InsigniaObtenida.self, Insignia.self, Evento.self, Visita.self, Foto.self, Exhibicion.self, ExhibicionObtenida.self], inMemory: true)
}
