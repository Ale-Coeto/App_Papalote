//
//  ContentView.swift
//  Reto
//
//  Created by Oscar Zhao Xu on 17/10/24.
//

import SwiftUI

struct ZoneView: View {
    @State var nombre = "Pertenezco"
    @State var descripción = "Pertenezco a una gran red de vida en la que todo se relaciona para funcionarasdjias."
    let exhibiciones = ["figure.walk.circle.fill", "figure.walk.circle.fill", "figure.walk.circle.fill"]
    let insignias = ["flag.pattern.checkered", "flag.pattern.checkered", "flag.pattern.checkered"]
    let fotos = ["camera.circle", "camera.circle", "camera.circle"]

    @State private var showBadgeSheet = false
    @State private var showExhibitionSheet = false
    @State private var showPhotoSheet = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Text(descripción)
                VStack {
                    Text("Exhibiciones")
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                    ScrollView(.horizontal, showsIndicators: true) {
                        HStack(spacing: 40) {
                            ForEach(exhibiciones, id: \.self) { exhibicion in
                                NavigationLink {
                                    ExhibitionView()
                                } label: {
                                    Image(systemName: exhibicion)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 80, height: 80)
                                        .clipShape(Circle())
                                        .overlay {
                                            Circle().stroke(Color.green, lineWidth: 5)
                                        }
                                        
                                }
                            }
                        }
                        .padding(.horizontal, 5)
                        .padding(.vertical, 5)
                    }
                }
                .padding()
                .background(Color.white)
                .cornerRadius(12)
                .shadow(color: Color.black.opacity(0.5), radius: 5, x: 4, y: 4)
            
                VStack {
                    Text("Insignias")
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                    ScrollView(.horizontal, showsIndicators: true) {
                        HStack(spacing: 40) {
                            ForEach(insignias, id: \.self) { insignia in
                                NavigationLink {
                                    BadgeView()
                                } label: {
                                    Image(systemName: insignia)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 80, height: 80)
                                        .clipShape(Circle())
                                        .overlay {
                                            Circle().stroke(Color.green, lineWidth: 5)
                                        }
                                        
                                }
                            }
                        }
                        .padding(.horizontal, 5)
                        .padding(.vertical, 5)
                    }
                }
                .padding()
                .background(Color.white)
                .cornerRadius(12)
                .shadow(color: Color.black.opacity(0.5), radius: 5, x: 4, y: 4)
            
                VStack {
                    Text("Fotos")
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                    ScrollView(.horizontal, showsIndicators: true) {
                        HStack(spacing: 40) {
                            ForEach(fotos, id: \.self) { foto in
                                NavigationLink {
                                    PhotoView()
                                } label: {
                                    Image(systemName: foto)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 80, height: 80)
                                        .clipShape(Circle())
                                        .overlay {
                                            Circle().stroke(Color.green, lineWidth: 5)
                                        }
                                        
                                }
                            }
                        }
                        .padding(.horizontal, 5)
                        .padding(.vertical, 5)
                    }
                }
                .padding()
                .background(Color.white)
                .cornerRadius(12)
                .shadow(color: Color.black.opacity(0.5), radius: 5, x: 4, y: 4)
                
                
            }
            .padding()
            .padding(.bottom, 40)
            .navigationTitle(nombre)
            .multilineTextAlignment(.center)
        }
    }
}

#Preview {
    ZoneView()
}
