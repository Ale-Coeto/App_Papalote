//
//  VisitaButton.swift
//  Papalote_MTY
//
//  Created by José Guerrero  on 21/10/24.
//

import SwiftUI

struct VisitaButton: View {
    var numero: Int
    var action: () -> Void
    
    var body: some View {
        HStack {
            Text("Visita \(numero)")
                .padding()
                .frame(width: 220, height: 70)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.white)
                        .shadow(color: Color.black.opacity(0.2), radius: 3, x: 2, y: 2)
                )
                .foregroundStyle(Color.black)
                .font(Font.custom("VagRounded-Light", size: 26))
        }
        .contentShape(Rectangle())
    }
}

#Preview {
    VisitaButton(numero: 1) {
        print("Button clicked!")
    }
}
