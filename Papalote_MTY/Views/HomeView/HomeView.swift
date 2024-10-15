//
//  HomeView.swift
//  Papalote_MTY
//
//  Created by Alejandra Coeto on 14/10/24.
//

import SwiftUI


struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationStack {
            HomeLayoutView(title: "Zonas")
                .overlay(
                    VStack {
                        
                        Card(title: viewModel.eventoEspecial.nombre, content: viewModel.eventoEspecial.descripcion)
                            .frame(height: 200)
                        
                        VStack (spacing: 20) {
                            ForEach(viewModel.zonas) {
                                zona in
                                NavigationLink {
                                    
                                } label: {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 10)
                                            .fill(Color(hex: zona.color))
                                            .shadow(radius: 5)
                                            .frame(minHeight: 50)
                                        
                                        Text(zona.nombre)
                                            .foregroundStyle(.white)
                                    }
                                }
                            }
                        }
                        .padding()
                    }
                        .padding(.top, Constants.HEADER_HEIGHT)
                        .padding()
                    
                )
        }
    }
    
}

#Preview {
    HomeView()
}
