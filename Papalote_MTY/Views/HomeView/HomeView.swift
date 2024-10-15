//
//  HomeView.swift
//  Papalote_MTY
//
//  Created by Alejandra Coeto on 14/10/24.
//

import SwiftUI


struct HomeView: View {
    
    var body: some View {
            HomeLayoutView(title: "Nav")
                .overlay(
                    Text("hi")
                )
        }
    
}

#Preview {
    HomeView()
}
