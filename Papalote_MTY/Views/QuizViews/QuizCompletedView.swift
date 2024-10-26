//
//  QuizCompletedView.swift
//  Papalote_MTY
//
//  Created by José Guerrero  on 25/10/24.
//

import SwiftUI

struct QuizCompletedView: View {
    var body: some View {
        ZStack {
            Color.AppColors.FondoAzulClaro
                .ignoresSafeArea()
            VStack{
                Text("Acabaste el quiz")
            }
        }
    }
}

#Preview {
    QuizCompletedView()
}
