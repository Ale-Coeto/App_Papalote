//
//  MapFooterView.swift
//  Papalote_MTY
//
//  Created by Alejandra Coeto on 24/10/24.
//

import SwiftUI

struct MapFooterView: View {
    @ObservedObject var mapViewModel: MapViewModel
    
    var body: some View {
        HStack {
            Text("Pisos:")
                .padding(.trailing,5)
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
        .padding(.leading)
        .padding(.top)
    }
}

#Preview {
    MapFooterView(mapViewModel: MapViewModel())
}
