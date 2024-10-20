//
//  HomeView.swift
//  Papalote_MTY
//
//  Created by Alejandra Coeto on 14/10/24.
//

import SwiftUI
import SwiftData

struct HomeView: View {
    @Query private var zona: [Zona]
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
                                    ZoneView(zona: zona)
                                } label: {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 10)
                                            .fill(Color(hex: zona.color))
                                            .shadow(radius: 5)
                                            .frame(minHeight: 50)
                                        HStack {
                                                
                                            Text(zona.nombre)
                                                .foregroundStyle(.white)
                                                .padding(.leading)
                                            Spacer()
                                            
                                            ZStack (alignment: .trailing) {
                                                HStack (spacing: 0) {

                                                    RightTriangle(width: 25, color: .white)
                                                        
                                                    ZStack {
                                                        
                                                        CustomRoundedRectangle(topLeftRadius: 0, topRightRadius: 10, bottomLeftRadius: 0, bottomRightRadius: 10)
                                                            .fill(.white)
                                                            .frame(width: 80)
                                                        
                                                        Image(zona.logo)
                                                            .resizable()
                                                            .aspectRatio(contentMode: .fit)
                                                            .padding(10)
                                                        
                                                        
                                                    }
                                                }
                                            }
                                        }
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
