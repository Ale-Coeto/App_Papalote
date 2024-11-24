//
//  HomeLayoutView.swift
//  Papalote_MTY
//
//  Created by Alejandra Coeto on 14/10/24.
//
//
//  HomeLayoutView.swift
//  Papalote_MTY
//
//  Created by Alejandra Coeto on 14/10/24.
//

import SwiftUI

struct HomeLayoutView: View {
    var title = ""
    var headerColor: Color = Color.green
    
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .ignoresSafeArea()
            
            VStack {
                ZStack(alignment: .top) { // Align the ZStack to the top
                    RoundedRectangle(cornerRadius: 0)
                        .fill(
                            LinearGradient(
                                gradient: Gradient(colors: [headerColor.opacity(0.7), headerColor.opacity(0.9)]),
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .frame(minHeight: 110, maxHeight: 130) // Allow it to grow as needed
                        .ignoresSafeArea()

                    // Align the title to the top within the ZStack
                    Text(title)
                        .foregroundColor(.white)
                        .font(Font.custom("VagRoundedBold", size: 32))
                        .fontWeight(.semibold)
                        .padding(.top, -30) // Adjust the top padding as needed
                }
                
                Spacer()
            }
        }
    }
}

#Preview {
    HomeLayoutView(title: "Papalote MTY", headerColor: Color.green)
}
