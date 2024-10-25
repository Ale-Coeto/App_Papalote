//
//  NavigationView.swift
//  Papalote_MTY
//
//  Created by Alejandra Coeto on 14/10/24.
//

import SwiftUI

struct NavigationView: View {
    @Environment(\.modelContext) private var context
    let visita: Visita
    var body: some View {
        HomeLayoutView(title: "Nav")
            .overlay(
                TabView {
                    HomeView(visita: visita)
                        .tabItem {
                            Label("Zonas", systemImage: "house")
                               
                        }
                    
                    HomeView(visita: visita)
                        .tabItem {
                            Label("Fotos", systemImage: "camera")
                                
                        }
                    
                    HomeView(visita: visita)
                        .tabItem {
                            Label("Visitas", systemImage: "map")
                                
                        }
                    
                    BadgesView(visita: visita)
                        .tabItem {
                            Label("Insignias", systemImage: "trophy")
                        }
                }
                .accentColor(Color("DarkGreen"))
            )
    }
}

#Preview {
    NavigationView(visita: Visita(id: 1, date: Date(), orden: "Pertenezco Comunico Comprendo Soy Expreso Pequeño"))
}
