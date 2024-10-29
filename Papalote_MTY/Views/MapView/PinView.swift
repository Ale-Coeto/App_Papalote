//
//  PinView.swift
//  Papalote_MTY
//
//  Created by Alejandra Coeto on 28/10/24.
//

import SwiftUI

struct PinView: View {
    var x: CGFloat
    var y: CGFloat
    var color: Color
    var icon: String
    
    var body: some View {
        
            ZStack (alignment: .center) {
                
                PointerTriangle(frameSize: 20)
                    .fill(.white)
                    .offset(y: 26)
                    .frame(width: 20, height: 20)
                    .shadow(radius: 3)
                
                Circle()
                    .fill(color)
                    .overlay {
                        Circle().stroke(Color.white, lineWidth: 3)
                    }
                    .shadow(radius: 3)
                    .frame(height: 45)                

                Image(systemName: icon)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundStyle(.white)
                    .frame(height: 20)
                    .frame(alignment: .center)
                                
            }
            .position(x:x, y:y)
            
            
            
        
        
    }
}

#Preview {
    PinView(x: 100, y: 100, color: .red, icon: "mappin")
}
