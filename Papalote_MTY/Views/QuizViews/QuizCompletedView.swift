//
//  QuizCompletedView.swift
//  Papalote_MTY
//
//  Created by José Guerrero  on 25/10/24.
//

import SwiftUI


struct QuizCompletedView: View {
    
    let mockZonaResultados: [ZonaResultadoQuiz] = [
        ZonaResultadoQuiz(
            id: 0,
            nombre: "Pertenezco",
            descripcion: """
            
            Tienes una profunda conexión con la
            naturaleza. Eres una persona tranquila,
            pero serías capaz de explorar el mundo.
            Tu color es el verde, cuyo significado se
            relaciona a la armonía, la calma interior y
            el equilibrio emocional.
            
            
            """,
            color: Color.AppColors.pertenezco,
            logo: UIImage(named: "pertenezco") ?? UIImage()
        ),
        ZonaResultadoQuiz(
            id: 1,
            nombre: "Soy",
            descripcion: """
            No le temes al deber ni a los retos más
            complicados. Eres alguien honesto que
            busca mejorar con cada error que
            comete. Tu color es el rojo, símbolo del
            amor, el fuego y la pasión.
            """,
            color: Color.AppColors.soy,
            logo: UIImage(named: "soy") ?? UIImage()
        ),
        ZonaResultadoQuiz(
            id: 2,
            nombre: "Comunico",
            descripcion: """
                Para ti el diálogo es lo más importante.
            Eres bastante fuerte con tus emociones y
            no dudas en alzar la voz cuando algo no
            te parece justo. Tu color es el azul, que
            inspira confianza y seguridad.
            """,
            color: Color.AppColors.comunico,
            logo: UIImage(named: "comunico") ?? UIImage()
        ),
        ZonaResultadoQuiz(
            id: 3,
            nombre: "Expreso",
            descripcion:
                """
            Eres una persona muy creativa, amas
            todo tipo de arte y fluyes con cada una de
            ellas. Tu color es el naranja, símbolo del
            entusiasmo, la confianza y la creatividad.
            """,
            color: Color.AppColors.expreso,
            logo: UIImage(named: "expreso") ?? UIImage()
        ),
        ZonaResultadoQuiz(
            id: 4,
            nombre: "Comprendo",
            descripcion:"""
                Aparentas una personalidad seria pero en
                realidad eres alguien bastante interesante
                que siempre tiene algo bueno por decir. Tu
                color es el morado, que representa la
                sabiduría, la imaginación, el misterio y la
                magia.
                """,
            color: Color.AppColors.comprendo,
            logo: UIImage(named: "comprendo") ?? UIImage()
        ),
        ZonaResultadoQuiz(
            id: 5,
            nombre: "Pequeños",
            descripcion: """
                Tienes una alma de niño, jamás dejas de
                asombrarte. Para ti el explorar el mundo
                que te rodea es increíble y representa una
                fuente de felicidad. Tu color es el celeste, se
                asocia con la tranquilidad, la generosidad y
                la protección.
                """,
            color: Color.AppColors.pequeños,
            logo: UIImage(named: "pequeños") ?? UIImage()
        )
    ]
    
    
    private func getTopZonaResultado() -> ZonaResultadoQuiz? {
            if let (id, _) = answers.max(by: { $0.value < $1.value }) {
                print()
                return mockZonaResultados.first(where: { $0.id == id })
            }
            return nil
        }
    
    @Binding var answers: [Int: Int]
    
    
    var body: some View {
        if let topZona = getTopZonaResultado() {
                    VStack {
                        Text(topZona.nombre)
                            .font(Font.custom("VagRoundedBold", size: 60))
                            .foregroundColor(topZona.color)
                        Text(topZona.descripcion)
                            .padding()
                        Image(uiImage: topZona.logo)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                    }
                } else {
                    Text("No results found.")
                }
    }
}

#Preview {
    QuizCompletedView(answers: .constant([0: 0]))
}
