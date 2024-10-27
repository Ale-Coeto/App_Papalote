//
//  MapContainerView.swift
//  Papalote_MTY
//
//  Created by Alejandra Coeto on 24/10/24.
//

import SwiftUI

struct MapContainerView: View {
    @ObservedObject var mapViewModel: MapViewModel
    let mapSize = CGSize(width: 1200, height: 800)

    let pins = [
        CGPoint(x: 300, y: 400),
        CGPoint(x: 900, y: 600),
        CGPoint(x: 600, y: 200)
    ]
    
    var body: some View {
        GeometryReader { geometry in
            let screenWidth = geometry.size.width
                        let screenHeight = geometry.size.height

                        // Calculate the current image size based on scale
            let currentWidth = mapSize.width * mapViewModel.scale
            let currentHeight = mapSize.height * mapViewModel.scale
                        
                        // Calculate the offset needed to center the image
                        let horizontalOffset = max((screenWidth - currentWidth) / 2, 0)
                        let verticalOffset = max((screenHeight - currentHeight) / 2, 0)
            ScrollView([.horizontal, .vertical], showsIndicators: false) {
                ZStack {
                    mapViewModel.mapImages[mapViewModel.selectedFloor-1]
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: mapSize.width * mapViewModel.scale, height: mapSize.height * mapViewModel.scale)
                        .gesture(
                            MagnificationGesture()
                                .onChanged { value in
                                    mapViewModel.scale = value // Update scale during pinch zoom
                                }
                        )
                    
                    // Add pins (fixed icons) at specific positions on the map
                    ForEach(pins.indices, id: \.self) { index in
                        let pinPosition = pins[index]
                        Image(systemName: "mappin.circle.fill")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.red)
                            .position(x: pinPosition.x * mapViewModel.scale, y: pinPosition.y * mapViewModel.scale)
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.black.opacity(0.1))
        }
    }
}

#Preview {
    MapContainerView(mapViewModel: MapViewModel())
}
