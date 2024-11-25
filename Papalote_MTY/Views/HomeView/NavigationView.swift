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
                    Group {
                        HomeView(visita: visita)
                            .tabItem {
                                Label("Zonas", systemImage: "house")
                                    .padding()
                                
                                
                            }
                        
                        
                        PhotosView(visita: visita)
                            .tabItem {
                                Label("Fotos", systemImage: "camera")
                                
                            }
                        
                        MapView(visita: visita)
                            .tabItem {
                                Label("Mapa", systemImage: "map")
                                
                            }
                        
                        BadgesView(visita: visita)
                            .tabItem {
                                Label("Insignias", systemImage: "trophy")
                            }
                    }
                    
                    
                    .toolbarBackground(.white, for: .tabBar)
                    .toolbarBackground(.visible, for: .tabBar)
                    
                    
                }
                    .accentColor(Color.AppColors.VerdePapalote)
                
                
            )
    }
}

#Preview {
    
    NavigationView(visita: Visita(id: 1, date: Date(), orden: "Pertenezco Comunico Comprendo Soy Expreso Pequeño"))
    
}
