//
//  NavigationView.swift
//  Papalote_MTY
//
//  Created by Alejandra Coeto on 14/10/24.
//

import SwiftUI

struct NavigationView: View {
    var body: some View {
        HomeLayoutView(title: "Nav")
            .overlay(
                TabView {
                    HomeView()
                        .tabItem {
                            Label("Zonas", systemImage: "house")
                               
                        }
                    
                    HomeView()
                        .tabItem {
                            Label("Fotos", systemImage: "camera")
                                
                        }
                    
                    HomeView()
                        .tabItem {
                            Label("Visitas", systemImage: "map")
                                
                        }
                    
                    BadgesView()
                        .tabItem {
                            Label("Insignias", systemImage: "trophy")
                                
                        }
                }
                .accentColor(Color("DarkGreen"))
            )
    }
}

#Preview {
    NavigationView()
}
