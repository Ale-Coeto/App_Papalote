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
    var scale: CGFloat
    
    
    var body: some View {
        
            ZStack (alignment: .center) {
                
                PointerTriangle(frameSize: Constants.PIN_SIZE*scale)
                    .fill(.white)
                    .offset(y: 26*scale)
                    .frame(width: Constants.PIN_SIZE*scale, height: Constants.PIN_SIZE*scale)
                    .shadow(radius: 3)
                
                Circle()
                    .fill(color)
                    .overlay {
                        Circle().stroke(Color.white, lineWidth: 3*scale)
                    }
                    .shadow(radius: 3)
                    .frame(height: (Constants.PIN_SIZE+15)*scale)

                Image(systemName: icon)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundStyle(.white)
                    .frame(height: Constants.PIN_SIZE*scale)
                    .frame(alignment: .center)
                                
            }
//            .background(.blue)
            .frame(width: (Constants.PIN_SIZE+20)*scale, height: Constants.PIN_SIZE*scale)
            .position(x:x, y:y)
            
            
            
            
        
        
    }
}

#Preview {
    PinView(x: 100, y: 100, color: .red, icon: "mappin", scale: 1)
}
