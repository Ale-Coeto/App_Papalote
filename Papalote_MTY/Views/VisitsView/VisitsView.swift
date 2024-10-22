//
//  VisitsView.swift
//  Papalote_MTY
//
//  Created by José Guerrero  on 21/10/24.
//

import SwiftUI

struct VisitsView: View {
    
    @State private var buttons: [Int] = []  // Array to store the numbers for the buttons
    @State private var nextNumber = 1
    
    var body: some View {
        ZStack {
            Color.AppColors.FondoAzulClaro
                .ignoresSafeArea()
            
            VStack {
                if buttons.isEmpty {
                    // Case 1: No visits, center the "Nueva visita" button
                    Spacer() // Push the button to the center of the screen
                    
                    Text("Oh oh, parece que no tienes ninguna visita...")
                        .font(Font.custom("VagRounded-Light", size: 20))
                        .padding()
                    Button("Primera visita") {
                        buttons.append(nextNumber)
                        nextNumber += 1
                        
                    }
                    .font(Font.custom("VagRoundedBold", size: 46))
                    .foregroundStyle(Color.white)
                    .frame(width: 320, height: 108)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .foregroundStyle(Color.AppColors.VerdePapalote)
                            .shadow(radius: 3, x: 2, y: 2)
                    )
                    Spacer() // Add a spacer below to keep the button in the middle
                    
                } else {
                    // Case 2: When there are visits, show the visits and button at the bottom
                    Text("Mis Visitas")
                        .padding(.top, 35)
                        .font(Font.custom("VagRoundedBold", size: 32))
                        .foregroundStyle(Color.AppColors.AzulPapalote)
                    
                    ScrollView {
                        LazyVStack(spacing: 10) {
                            ForEach(buttons, id: \.self) { buttonNumber in
                                VisitaButton(numero: buttonNumber) {
                                    print("Button \(buttonNumber) clicked")
                                }
                            }
                            .padding(30)
                        }
                    }
                    Spacer()
                    
                    Button("Nueva visita") {
                        buttons.append(nextNumber)
                        nextNumber += 1
                    }
                    .padding()
                    .font(Font.custom("VagRoundedBold", size: 26))
                    .foregroundStyle(Color.white)
                    .frame(width: 220, height: 58)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .foregroundStyle(Color.AppColors.VerdePapalote)
                    )
                    .padding(.bottom, 100)
                }
                
            }
        }
    }
}

#Preview {
    VisitsView()
}
