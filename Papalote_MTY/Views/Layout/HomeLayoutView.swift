//
//  HomeLayoutView.swift
//  Papalote_MTY
//
//  Created by Alejandra Coeto on 14/10/24.
//

import SwiftUI


struct HomeLayoutView: View {
    var title = ""
    
    var body: some View {
        ZStack {
            Color("Background")
                .ignoresSafeArea()
            
            VStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 0)
                        .fill(
                        LinearGradient(gradient: Gradient(colors: [Color("LightGreen"), Color("DarkGreen")]), startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/))
                        .ignoresSafeArea()
                        .frame(height: Constants.HEADER_HEIGHT)
                    Text(title)
                        .foregroundStyle(.white)
                        .font(.title)
                        .fontWeight(.semibold)
                }
                
                Spacer()
            }
            
            
        }
        
    }
}

#Preview {
    HomeLayoutView(title: "Papalote MTY")
}
