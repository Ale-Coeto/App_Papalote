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
    @State private var mostAnswers: Int = 0
    @State private var isQuizCompleted: Bool = false
    
    let visita: Visita
    
    // Use Query to fetch the questions and responses from the context
    @Query private var preguntas: [Pregunta]
    @Query private var respuestas: [Respuesta]
    
    @State private var currentQuestion: Pregunta? = nil
    @State private var currentAnswers: [String] = []
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.AppColors.FondoAzulClaro
                    .ignoresSafeArea()
                    .navigationBarBackButtonHidden(true)
                
                // Main container with fixed size
                VStack(spacing: 10) {
                    // Question container with fixed size
                    ZStack {
                        RoundedRectangle(cornerRadius: 12)
                            .frame(width: 350, height: 150)
                            .foregroundStyle(Color.white)
                            .shadow(radius: 5)
                        Text(currentQuestion?.pregunta ?? "Loading question...")
                            .padding(.horizontal, 25)
                            .font(Font.custom("VagRounded-Light", size: 20))
                        
                        
                            .multilineTextAlignment(.center)
                            .frame(maxWidth: .infinity) // This ensures the text takes full width
                            .padding(.top, 5) // Start from the top with padding
                            .minimumScaleFactor(0.3) // Scale down text if needed
                            .lineLimit(6)
                    }
                    .frame(height: 150) // Fixed height for question container
                    .padding(.top, 40)
                    
                    // Responses grid container with fixed size
                    VStack(spacing: 8) {
                        // Response buttons for each question (use dynamic responses here)
                        ForEach(0..<currentAnswers.count / 2, id: \.self) { rowIndex in
                            HStack(spacing: 10) {
                                responseButton(responseIndex: rowIndex * 2)
                                responseButton(responseIndex: rowIndex * 2 + 1)
                            }
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity) // Take remaining space
                }
                .padding(.vertical)
                .navigationDestination(isPresented: $isQuizCompleted) {
                    SplashScreen(splasherText: "Cargando resultados.") {
                        QuizCompletedView(visita: visita, answers: $answers)
                    }
                }
            }
            .onAppear {
                // Load the first question when the view appears
                loadNextQuestion()
            }
        }
    }
    
    private func loadNextQuestion() {
        // Ensure we have loaded all the questions
        guard !preguntas.isEmpty else { return }
        
        // Set the current question
        currentQuestion = preguntas[index]
        
        // Get the responses for the current question
        currentAnswers = respuestas.filter { $0.idPregunta == currentQuestion?.id ?? 0 }
                                    .map { $0.respuesta }
    }
    
    @ViewBuilder
    private func responseButton(responseIndex: Int) -> some View {
        Button {
            if index < preguntas.count - 1 {
                answers[responseIndex, default: 0] += 1
                index += 1
                loadNextQuestion()
            }
            else {
                answers[responseIndex, default: 0] += 1
                isQuizCompleted = true
                print(answers)
            }
            
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .foregroundStyle(getBackgroundColor(for: responseIndex))
                
                VStack {
                    Text(currentAnswers[responseIndex])
                        .foregroundStyle(Color.white)
                        .multilineTextAlignment(.center)
                        .font(Font.custom("VagRounded-Light", size: 20))
                        .frame(maxWidth: .infinity) // This ensures the text takes full width
                        .padding(.top, 5) // Start from the top with padding
                        .minimumScaleFactor(0.3) // Scale down text if needed
                        .lineLimit(6) // Limit the number of lines to avoid overflow
                }
                .padding()
            }
        }
        .frame(
            width: UIScreen.main.bounds.width >= 402 ? 170 : 150,
            height: UIScreen.main.bounds.width >= 402 ? 170 : 130
        )
        .clipped() // Prevents content from overflowing
    }
    
    private func getBackgroundColor(for index: Int) -> Color {
        switch index {
        case 0: return Color.AppColors.pertenezco
        case 1: return Color.AppColors.soy
        case 2: return Color.AppColors.comunico
        case 3: return Color.AppColors.expreso
        case 4: return Color.AppColors.comprendo
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
