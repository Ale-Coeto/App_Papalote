//
//  MapFooterView.swift
//  Papalote_MTY
//
//  Created by Alejandra Coeto on 24/10/24.
//

import SwiftUI

struct MapHeaderView: View {
    @ObservedObject var mapViewModel: MapViewModel
    
    var body: some View {
        HStack {
            Text("Piso:")
                .font(Font.custom("VagRounded-Light", size: 18))
                .padding(.trailing,10)
            HStack {
                Button() {
                    mapViewModel.changeFloor(1)
                } label: {
                    CircleButtonView(color: .blue, label: "1", selected: mapViewModel.selectedFloor == 1)
                }
                .padding(.trailing, 5)
                Button() {
                    mapViewModel.changeFloor(2)
                } label: {
                    CircleButtonView(color: .green, label: "2", selected: mapViewModel.selectedFloor == 2)
                }
            }
        }
        .padding()
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 60))
        .shadow(radius: 5)
        
    }
}

#Preview {
    ZStack {
        Color(.gray).opacity(0.5)
        MapHeaderView(mapViewModel: MapViewModel())
    }
}
