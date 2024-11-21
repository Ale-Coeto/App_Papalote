//
//  PopUpInsigniaCompletada.swift
//  Papalote_MTY
//
//  Created by José Guerrero  on 20/11/24.
//

import SwiftUI

struct PopUpTagCorrectoIncorrecto: View {
    var message : String = "Oh oh, parece que no es la insignia correcta. Sigue buscando para encontrarla."
    var isCorrect : Bool = false
    var body: some View {
        HStack {
            Text(message)
                .font(Font.custom("VagRoundedBold", size: 18))
                .foregroundColor(.white)
                .padding()
                .background(isCorrect ? Color.green : Color.red)
                .cornerRadius(10)
        }
        .padding()
        .cornerRadius(10)
        .shadow(radius: 10)
        .position(x:200,y: 30)
    }
}

#Preview {
    PopUpTagCorrectoIncorrecto()
}
