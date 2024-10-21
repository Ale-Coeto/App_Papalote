//
//  VisitaButton.swift
//  Papalote_MTY
//
//  Created by José Guerrero  on 21/10/24.
//

import SwiftUI

struct VisitaButton: View {
    @State var title: String = "Visita 1"
    var body: some View {
        Button{
            
        } label: {
            Text(title)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.white) // Button background color
                        .frame(width:220, height:70)
                        .shadow(radius: 5)
                )
                .foregroundStyle(Color.black)    // Text color
                .font(Font.custom("VagRounded-Light", size: 26))
                
        }
    }
}

#Preview {
    VisitaButton()
}
