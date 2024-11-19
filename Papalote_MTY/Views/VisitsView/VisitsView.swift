//
//  VisitsView.swift
//  Papalote_MTY
//
//  Created by José Guerrero  on 21/10/24.
//

import SwiftUI
import SwiftData

struct VisitsView: View {
    @Environment(\.modelContext) private var context
    @Query private var visitas: [Visita]
    @State private var nextNumber: Int = 1
    @State private var newVisit: Visita?
    @State private var shouldNavigateToNFCUnblock = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.AppColors.FondoAzulClaro
                    .ignoresSafeArea()
                VStack {
                    if visitas.isEmpty {
                        NoVisitsView(nextNumber: $nextNumber, context: context, newVisit: $newVisit, shouldNavigateToNFCUnblock: $shouldNavigateToNFCUnblock)
                    } else {
                        UserWithVisits(nextNumber: $nextNumber, context: context)
                    }
                }
            }
            .onAppear {
                // Update nextNumber based on existing visits
                if let maxId = visitas.map({ $0.id }).max() {
                    nextNumber = maxId + 1
                }
            }
            .navigationDestination(isPresented: $shouldNavigateToNFCUnblock) {
                if let visit = newVisit {
                    WelcomeView(visita: visit)
                }
            }
        }
    }
}

struct NoVisitsView: View {
    @Binding var nextNumber: Int
    var context: ModelContext
    @Binding var newVisit: Visita?
    @Binding var shouldNavigateToNFCUnblock: Bool
    
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
                shouldNavigateToNFCUnblock = true
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
        let visit = Visita(id: nextNumber, date: Date(), orden: "")
        context.insert(visit)
        nextNumber += 1
        do {
            try context.save()
            newVisit = visit
        } catch {
            print("Error saving new visit: \(error)")
        }
    }
}

struct UserWithVisits: View {
    @Binding var nextNumber: Int
    @Query private var visitas: [Visita]
    var context: ModelContext
    
    @State private var isAlertOn: Bool = false
    @State private var newVisit: Visita?
    @State private var shouldNavigate = false
    
    var body: some View {
        VStack {
            Text("Mis Visitas")
                .padding(.top, 35)
                .font(Font.custom("VagRoundedBold", size: 32))
                .foregroundStyle(Color.AppColors.AzulPapalote)

            ScrollView {
                LazyVStack(spacing: 10) {
                    ForEach(visitas.sorted(by: { $0.id < $1.id })) { visita in
                        NavigationLink(destination: {
                            if visita.orden == "" {
                                WelcomeBackView(visita: visita)
                            } else {
                                MainView(visita: visita)
                            }
                        }) {
                            VisitaButton(numero: visita.id) {
                                // Action handled by NavigationLink
                            }
                        }
                    }
                }
                .padding(30)
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
            .navigationDestination(isPresented: $shouldNavigate) {
                if let visit = newVisit {
                    WelcomeBackView(visita: visit)
                }
            }
        }
    }
    
    private func addNewVisit() {
        let visit = Visita(id: nextNumber, date: Date(), orden: "")
        context.insert(visit)
        nextNumber += 1
        do {
            try context.save()
            newVisit = visit
            shouldNavigate = true
        } catch {
            print("Error saving new visit: \(error)")
        }
    }
}

#Preview {
    VisitsView()
        .modelContainer(for: Visita.self, inMemory: true)
}
