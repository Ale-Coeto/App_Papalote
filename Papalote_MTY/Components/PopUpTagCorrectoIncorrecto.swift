//
//  PopUpInsigniaCompletada.swift
//  Papalote_MTY
//
//  Created by José Guerrero  on 20/11/24.
//

import SwiftUI

struct PopUpTagCorrectoIncorrecto: View {
    var messageCorrect : String = "¡Tag Incorrecto!"
    var messageIncorect : String = "¡Tag Correcto!"
    var isCorrect : Bool
    var Tag : NFCTag
    var body: some View {
        HStack {
            Text(isCorrect ? messageIncorect : messageCorrect)
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
    PopUpTagCorrectoIncorrecto(isCorrect: true, Tag: NFCTag(id: 1, tagName: "Hola", date: Date(), scanned: true))
}
