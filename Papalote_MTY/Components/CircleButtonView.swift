//
//  CircleButtonView.swift
//  Papalote_MTY
//
//  Created by Alejandra Coeto on 21/10/24.
//

import SwiftUI

struct CircleButtonView: View {
    var color: Color
    var label: String
    var selected: Bool
    
    var body: some View {
        ZStack {
            Circle()
                .fill(color)
                .stroke(Color.white, lineWidth: 3)
                .opacity(selected ? 1 : 0.5)
                .shadow(radius: 3)
                .frame(width: 50, height: 50)

            
            Text(label)
                .foregroundStyle(.white)
        }
        
    }
    
}

#Preview {
    CircleButtonView(color: .blue, label: "Hi", selected: true)
        .background(.black)
}
