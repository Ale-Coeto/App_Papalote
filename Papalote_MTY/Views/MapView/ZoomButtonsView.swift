//
//  MapHeaderView.swift
//  Papalote_MTY
//
//  Created by Alejandra Coeto on 24/10/24.
//

import SwiftUI

struct ZoomButtonsView: View {
    @ObservedObject var mapViewModel: MapViewModel
    
    var body: some View {
        HStack {
            Spacer()
            VStack (spacing: 20) {
                Button() {
                    if mapViewModel.scale < 1.5 {
                        mapViewModel.scale += 0.1
                    }
                } label: {
                    Image(systemName: "plus")
                        .font(.largeTitle)
                        .frame(width: 50, height: 50)
                        .background(.white)
                        .clipShape(Circle())
                        .shadow(radius: 5)
                }
                
                Button() {
                    if mapViewModel.scale > 0.3 {
                        mapViewModel.scale -= 0.1
                    }
                } label: {
                    Image(systemName: "minus")
                        .font(.largeTitle)
                        .frame(width: 50, height: 50)
                        .background(.white)
                        .clipShape(Circle())
                        .shadow(radius: 5)
                }
            }
            
        }
        .padding(30)
    }
}

#Preview {
    ZStack {
        Color(.gray)
        ZoomButtonsView(mapViewModel: MapViewModel())
    }
}
