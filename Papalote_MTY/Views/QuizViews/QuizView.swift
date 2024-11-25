//
//  QuizView.swift
//  Papalote_MTY
//
//  Created by José Guerrero  on 25/10/24.
//

import SwiftUI
import SwiftData

struct QuizView: View {
    
    @State private var index: Int = 0
    @State private var answers: [Int: Int] = [
        0: 0,
        1: 0,
        2: 0,
        3: 0,
        4: 0,
        5: 0
    ]
    @State private var isQuizCompleted: Bool = false
    
    let visita: Visita
    
    @Query private var preguntas: [Pregunta]
    @Query private var respuestas: [Respuesta]
    
    @State private var currentQuestion: Pregunta? = nil
    @State private var currentAnswers: [(answer: String, zoneId: Int)] = []
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.AppColors.FondoAzulClaro
                    .ignoresSafeArea()
                    .navigationBarBackButtonHidden(true)
                
                VStack(spacing: 10) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 12)
                            .frame(width: 350, height: 150)
                            .foregroundStyle(Color.white)
                            .shadow(radius: 5)
                        Text(currentQuestion?.pregunta ?? "Loading question...")
                            .padding(.horizontal, 25)
                            .font(Font.custom("VagRounded-Light", size: 20))
                            .multilineTextAlignment(.center)
                            .frame(maxWidth: .infinity)
                            .padding(.top, 5)
                            .minimumScaleFactor(0.3)
                            .lineLimit(6)
                    }
                    .frame(height: 150)
                    .padding(.top, 40)
                    
                    VStack(spacing: 8) {
                        ForEach(0..<currentAnswers.count / 2, id: \.self) { rowIndex in
                            HStack(spacing: 10) {
                                responseButton(responseIndex: rowIndex * 2)
                                responseButton(responseIndex: rowIndex * 2 + 1)
                            }
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
                .padding(.vertical)
                .navigationDestination(isPresented: $isQuizCompleted) {
                    SplashScreen(splasherText: "Cargando resultados.") {
                        QuizCompletedView(visita: visita, answers: $answers)
                    }
                }
            }
            .onAppear {
                loadNextQuestion()
            }
        }
    }
    
    private func loadNextQuestion() {
        guard !preguntas.isEmpty else { return }
        
        currentQuestion = preguntas[index]
        
        let zoneOrder = [1, 2, 3, 4, 5, 6]
        
        currentAnswers = respuestas
            .filter { $0.idPregunta == currentQuestion?.id ?? 0 }
            .map { (answer: $0.respuesta, zoneId: $0.idZona) }
            .sorted { zoneOrder.firstIndex(of: $0.zoneId) ?? Int.max < zoneOrder.firstIndex(of: $1.zoneId) ?? Int.max }
    }
    
    @ViewBuilder
    private func responseButton(responseIndex: Int) -> some View {
        Button {
            // Get the zone ID for the current answer
            let zoneId = currentAnswers[responseIndex].zoneId
            
            // Manual mapping to correct zone based on the description you provided
            let correctZoneId = mapZoneId(originalZoneId: zoneId)
            
            if index < preguntas.count - 1 {
                // Increment the answer count for the specific zone
                answers[correctZoneId - 1, default: 0] += 1
                index += 1
                loadNextQuestion()
            }
            else {
                // For the last question, increment and mark quiz as completed
                answers[correctZoneId - 1, default: 0] += 1
                isQuizCompleted = true
                print(answers)
            }
            
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .foregroundStyle(getBackgroundColor(for: responseIndex))
                
                VStack {
                    Text(currentAnswers[responseIndex].answer)
                        .foregroundStyle(Color.white)
                        .multilineTextAlignment(.center)
                        .font(Font.custom("VagRounded-Light", size: 20))
                        .frame(maxWidth: .infinity)
                        .padding(.top, 5)
                        .minimumScaleFactor(0.3)
                        .lineLimit(6)
                }
                .padding()
            }
        }
        .frame(
            width: UIScreen.main.bounds.width >= 402 ? 170 : 150,
            height: UIScreen.main.bounds.width >= 402 ? 170 : 130
        )
        .clipped()
    }

    // Add this helper function to map the zones
    private func mapZoneId(originalZoneId: Int) -> Int {
        switch originalZoneId {
        case 1: return 1
        case 2: return 3
        case 3: return 5
        case 4: return 2
        case 5: return 4
        case 6: return 6  
        default: return originalZoneId
        }
    }
    
    private func getBackgroundColor(for index: Int) -> Color {
        switch index {
        case 0: return Color.AppColors.pertenezco
        case 1: return Color.AppColors.comunico
        case 2: return Color.AppColors.comprendo
        case 3: return Color.AppColors.soy
        case 4: return Color.AppColors.expreso
        case 5: return Color.AppColors.pequeños
        default: return Color.gray
        }
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Pregunta.self, Respuesta.self, configurations: config)
        
        // Agregar datos mock
        MockDataManager.addMockData(to: container.mainContext)
        
        // Aquí puedes agregar prints para verificar
        let preguntas = try container.mainContext.fetch(FetchDescriptor<Pregunta>())
        print("Preguntas cargadas: \(preguntas.count)")
        preguntas.forEach { print($0.pregunta) }
        
        let respuestas = try container.mainContext.fetch(FetchDescriptor<Respuesta>())
        print("Respuestas cargadas: \(respuestas.count)")
        respuestas.forEach { print($0.respuesta) }
        
        return QuizView(visita: Visita(id: 1, date: Date(), orden: "Pertenezco Comunico Comprendo Soy Expreso Pequeño"))
            .modelContainer(container)
    } catch {
        print("Error setting up preview: \(error)")
        return Text("Error setting up preview")
    }
}
