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
    
    
    var body: some View {
        HomeLayoutView(title: "Mapa")
            .overlay(
                VStack {
                    ZStack {
                        MapContainerView(mapViewModel: mapViewModel)
                        
                        //Header
                        MapHeaderView(mapViewModel: mapViewModel)
                                                
                    }
                    
                    // Footer
                    MapFooterView(mapViewModel: mapViewModel)
                    
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
