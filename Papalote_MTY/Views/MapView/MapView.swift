//
//  MapView.swift
//  Papalote_MTY
//
//  Created by Alejandra Coeto on 21/10/24.
//

import SwiftUI

struct MapView: View {
    @StateObject var mapViewModel = MapViewModel()
    @StateObject var locationManager = LocationManager()
    
    @State private var scale: CGFloat = 1.0 
    let mapSize = CGSize(width: 1200, height: 800)

    let pins = [
        CGPoint(x: 300, y: 400),
        CGPoint(x: 900, y: 600),
        CGPoint(x: 600, y: 200)
    ]
    
    var body: some View {
        HomeLayoutView(title: "Mapa")
            .overlay(
                
                VStack {
                 
                    ZStack {
                        GeometryReader { geometry in
                            ScrollView([.horizontal, .vertical], showsIndicators: false) {
                                ZStack {
                                    
                                    Image("Map")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: mapSize.width * scale, height: mapSize.height * scale)
                                        .gesture(
                                            MagnificationGesture()
                                                .onChanged { value in
                                                    scale = value // Update scale during pinch zoom
                                                }
                                        )
                                    
                                    // Add pins (fixed icons) at specific positions on the map
                                    ForEach(pins.indices, id: \.self) { index in
                                        let pinPosition = pins[index]
                                        Image(systemName: "mappin.circle.fill")
                                            .resizable()
                                            .frame(width: 30, height: 30)
                                            .foregroundColor(.red)
                                            .position(x: pinPosition.x * scale, y: pinPosition.y * scale)
                                    }
                                    
                                    
                                }
                            }
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(Color.gray.opacity(0.3))
                        }
                        VStack {
                            ZStack {
                                Rectangle()
                                    .fill(.black)
                                    .frame(height: 50)
                                    .opacity(0.4)
                                
                                HStack {
                                    Text("Piso \(mapViewModel.selectedFloor)")
                                        .font(.title2)
                                        .fontWeight(.semibold)
                                        .padding(.horizontal)
                                        .foregroundStyle(.white)
                                    
                                    Spacer()
                                    Button() {
                                        if scale > 0.4 {
                                            scale -= 0.1
                                        }
                                        
                                    } label: {
                                        Image(systemName: "minus.magnifyingglass")
                                            .font(.title)
                                    }
                                    Button() {
                                        if scale < 1 {
                                            scale += 0.1
                                        }
                                        
                                    } label: {
                                        Image(systemName: "plus.magnifyingglass")
                                            .font(.title)
                                    }
                                    
                                }
                            }
                            Spacer()
                        }
                                                
                    }
                    
                    VStack {
                        Text("Pisos")
                        HStack {
                            Button() {
                                mapViewModel.changeFloor(1)
                            } label: {
                                CircleButtonView(color: .blue, label: "1", selected: mapViewModel.selectedFloor == 1)
                            }
                            Button() {
                                mapViewModel.changeFloor(2)
                            } label: {
                                CircleButtonView(color: .green, label: "2", selected: mapViewModel.selectedFloor == 2)
                            }
                        }
                    }
                    
//                    Text("Latitude: \(String(describing: locationManager.latitude)),  \(String(describing: locationManager.longitude))")
                    
                }

                    .onAppear {
                        
                    }
                    .padding(.top, Constants.HEADER_HEIGHT)
            )
    }
    
}

#Preview {
    MapView()
}
