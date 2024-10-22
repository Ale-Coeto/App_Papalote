//
//  VisitaButton.swift
//  Papalote_MTY
//
//  Created by José Guerrero  on 21/10/24.
//

import SwiftUI

struct VisitaButton: View {
    var numero: Int // Use a simple var instead of @State since it's passed from the parent
    var action: () -> Void // Closure for handling button actions
    
    var body: some View {
        Button(action: {
            action() // Perform the passed-in action when button is clicked
        }) {
            Text("Visita \(numero)")
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.white) // Button background color
                        .frame(width: 220, height: 70)
                        .shadow(radius: 3, x: 2, y: 2)
                )
                .foregroundStyle(Color.black)    // Text color
                .font(Font.custom("VagRounded-Light", size: 26))
        }
    }
}

#Preview {
    VisitaButton(numero: 1) {
        print("Button clicked!")
    }
}
