//
//  QuizView.swift
//  Papalote_MTY
//
//  Created by José Guerrero  on 25/10/24.
//

import SwiftUI

struct QuizView: View {
    
    @State private var index: Int = 0
    
    @State var answers: [Int: Int] = [
            0: 0,
            1: 0,
            2: 0,
            3: 0,
            4: 0,
            5: 0
        ]
    
    @State var mostAnwsers: Int = 0
    @State var isQuizCompleted: Bool = false
    
    @State private var questions: [Question] = [
        // Hardcoded Questions and Anwsers. NOT MOST OPTIMAL
        
        // TODO: Make a function in Quiz.swift that allows to read JSON files and turn the data into this struct/class
        
           Question(questionText: "De estos colores,                                                     ¿cuál es el que más te gusta?", responses: ["Verde", "Rojo", "Azul", "Naranja", "Morado", "Celeste"]),
           
           Question(questionText: "¿Qué género de película disfrutas más?", responses: ["Cualquier género está bien", "Acción", "Comedia", "Fantasía", "Ciencia ficción", "Animadas"]),
           
           Question(questionText: "¿Qué le dirías a tu niño interior?", responses: [
               "La flor que florece en la adversidad es la más rara y hermosa de todas.",
               "No todas las decisiones tienen que ser perfectas, a veces lo que importa es intentarlo.",
               "Tienes una voz única, y el mundo necesita escucharla.",
               "Sabes que en caso de no tener música de fondo, tú puedes crear la tuya.",
               "Comprenderte a ti mismo es el primer paso para comprender a los demás.",
               "Gracias por esta aventura, ahora me toca vivir una nueva."
           ]),
           
           Question(questionText: "¿Con qué frase te identificas más?", responses: [
               "“Mira profundamente en la naturaleza y entonces comprenderás todo mejor”                    (Albert Einstein).",
               "“Eres lo que haces, no lo que dices que harás.”        (Carl Jung).",
               "“Cuando cambiamos la forma en que nos comunicamos, cambiamos la sociedad.”                (Clay Shirky).",
               "“La vida es un lienzo en blanco, y debes lanzar sobre él toda la pintura que puedas.”        (Danny Kaye).",
               "“Lo que conocemos es una gota, lo que no conocemos es un océano.”    (Isaac Newton).",
               "“Todas las personas mayores fueron al principio niños, aunque pocas lo recuerdan.” (Antoine de Saint-Exupéry)."
           ]),
           
           Question(questionText: "¿Qué pasatiempo prefieres?", responses: ["Disfrutar de la naturaleza.", "Ir de compras.", "Ver redes sociales.", "Escuchar música", "Experimentar cosas nuevas.", "Convivir en familia."]),
           
           Question(questionText: "¿Cuál es tu género musical favorito?", responses: ["Regional mexicano", "Rock", "Electrónica", "Disfruto todos los géneros", "Clásica", "Pop"]),
           
           Question(questionText: "¿Cuál tema te gusta más?", responses: ["Biología", "Matemáticas", "Tecnologías", "Arte", "Química", "Educación física"])
       ]
   
    
    
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
                    Text(questions[index].questionText)
                        .padding(.horizontal, 20)
                        .font(Font.custom("VagRounded-Light", size: 20))
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: .infinity) // This ensures the text takes full width
                        .padding(.top, 5) // Start from the top with padding
                        .minimumScaleFactor(0.3) // Scale down text if needed
                        .lineLimit(6)
                }
                .frame(height: 150) // Fixed height for question container
                .padding(.top,40)
                
                // Responses grid container with fixed size
                VStack(spacing: 8) {
                    // First row
                    HStack(spacing: 10) {
                        responseButton(responseIndex: 0)
                        responseButton(responseIndex: 1)
                    }
                    
                    // Second row
                    HStack(spacing: 10) {
                        responseButton(responseIndex: 2)
                        responseButton(responseIndex: 3)
                    }
                    
                    // Third row
                    HStack(spacing: 10) {
                        responseButton(responseIndex: 4)
                        responseButton(responseIndex: 5)
                    }
                }
                .frame(maxWidth: .infinity ,maxHeight: .infinity) // Take remaining space
            }
            .padding(.vertical)
            .navigationDestination(isPresented: $isQuizCompleted) {
                SplashScreen(splasherText: "Cargando resultados.") {
                    QuizCompletedView(answers: $answers)
                }
            }
        }
    }
}
       
       @ViewBuilder
       private func responseButton(responseIndex: Int) -> some View {
           Button {
               if index < questions.count - 1 {
                   answers[responseIndex, default: 0] += 1
                   index += 1
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
                       Text(questions[index].responses[responseIndex])
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
    QuizView()
}
