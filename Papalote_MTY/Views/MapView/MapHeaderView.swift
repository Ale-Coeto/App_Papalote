//
//  MapHeaderView.swift
//  Papalote_MTY
//
//  Created by Alejandra Coeto on 24/10/24.
//

import SwiftUI

struct MapHeaderView: View {
    @ObservedObject var mapViewModel: MapViewModel
    
    var body: some View {
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
                        if mapViewModel.scale > 0.4 {
                            mapViewModel.scale -= 0.1
                        }
                        
                    } label: {
                        Image(systemName: "minus.magnifyingglass")
                            .font(.title)
                    }
                    Button() {
                        if mapViewModel.scale < 1 {
                            mapViewModel.scale += 0.1
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
}

#Preview {
    MapHeaderView(mapViewModel: MapViewModel())
}
