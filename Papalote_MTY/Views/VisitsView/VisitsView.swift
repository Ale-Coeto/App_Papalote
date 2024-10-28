//
//  VisitsView.swift
//  Papalote_MTY
//
//  Created by José Guerrero  on 21/10/24.
//

import SwiftUI
import SwiftData

struct VisitsView: View {
    @State var buttons: [Int] = []  // Array to store the numbers for the buttons
    @State var nextNumber: Int = 1
    
    @Environment(\.modelContext) private var context
    
    var body: some View {
        ZStack {
            Color.AppColors.FondoAzulClaro
                .ignoresSafeArea()
            VStack {
                if buttons.isEmpty {
                    NoVisitsView(buttons: $buttons, nextNumber: $nextNumber, context: context)
                } else {
                    UserWithVisits(buttons: $buttons, nextNumber: $nextNumber, context: context)
                }
            }
        }
    }
}

struct NoVisitsView: View {
    @Binding var buttons: [Int]
    @Binding var nextNumber: Int
    var context: ModelContext  // Add the context
    
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
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            Spacer()
            
            Button("Primera visita") {
                addNewVisit()
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
    
    private func addNewVisit() {
        let newVisit = Visita(id: nextNumber, date: Date(), orden: "Orden \(nextNumber)")
        buttons.append(nextNumber)
        nextNumber += 1
        do {
            try context.save()
        } catch {
            print("Error saving new visit: \(error)")
        }
    }
}

struct UserWithVisits: View {
    @Binding var buttons: [Int]
    @Binding var nextNumber: Int
    var context: ModelContext  // Add the context
    
    @State var isAlertOn: Bool = false
    
    var body: some View {
        VStack {
            Text("Mis Visitas")
                .padding(.top, 35)
                .font(Font.custom("VagRoundedBold", size: 32))
                .foregroundStyle(Color.AppColors.AzulPapalote)
            
            ScrollView {
                LazyVStack(spacing: 10) {
                    ForEach(buttons, id: \.self) { buttonNumber in
                        VisitaButton(numero: buttonNumber) {}
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
                        addNewVisit()
                    }),
                    secondaryButton: .destructive(Text("Cancelar"))
                )
            }
        }
    }
    
    private func addNewVisit() {
        let newVisit = Visita(id: nextNumber, date: Date(), orden: "Orden \(nextNumber)")
        buttons.append(nextNumber)
        nextNumber += 1
        do {
            try context.save()
        } catch {
            print("Error saving new visit: \(error)")
        }
    }
}

#Preview {
    VisitsView()
        .modelContainer(for: Visita.self, inMemory: true)
}
