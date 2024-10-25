//
//  VisitsView.swift
//  Papalote_MTY
//
//  Created by José Guerrero  on 21/10/24.
//

import SwiftUI

struct VisitsView: View {
    
    @State var buttons: [Int] = []  // Array to store the numbers for the buttons
    @State var nextNumber: Int = 1
    
    var body: some View {
        ZStack {
            Color.AppColors.FondoAzulClaro
                .ignoresSafeArea()
            VStack {
                
                if buttons.isEmpty {
                    //Case 1: New User, has no visits
                    NoVisitsView(buttons: $buttons, nextNumber: $nextNumber)
                } else {
                    //Case2: User has visits and wants to visit old ones or create a new visit
                    UserWithVisits(buttons: $buttons, nextNumber: $nextNumber)
                }
            }
        }
    }
}

#Preview {
    VisitsView()
}

struct NoVisitsView: View {
    @Binding var buttons: [Int]
    @Binding var nextNumber: Int
    
    var body: some View {
        VStack {
            Text("Mis Visitas")
                .padding(.top, 35)
                .font(Font.custom("VagRoundedBold", size: 32))
                .foregroundStyle(Color.AppColors.AzulPapalote)
            
            Spacer()
            
            ZStack {
                Color.AppColors.FondoAzulClaro
                
                Text("¡Oh no! Parece que no tienes ninguna visita...")
                    .font(Font.custom("VagRounded-Light", size: 24))
                    .padding()
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity, maxHeight: .infinity) // Centra en toda la pantalla
            }
            Spacer()
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
            .padding(.bottom, 100)
        }
    }
}

struct UserWithVisits: View {
    @Binding var buttons: [Int]
    @Binding var nextNumber: Int
    
    @State var isAlertOn: Bool = false
    
    var body: some View {
        VStack {
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
                isAlertOn = true
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
            .alert(isPresented: $isAlertOn) {
                Alert(
                    title: Text("Crear visita"),
                    message: Text("¿Quieres crear una nueva visita?"),
                    primaryButton: .default(Text("Crear visita"), action: {
                        buttons.append(nextNumber)
                        nextNumber += 1
                    }),
                    secondaryButton: .destructive(Text("Cancelar"))
                )
            }
        }
    }
}
