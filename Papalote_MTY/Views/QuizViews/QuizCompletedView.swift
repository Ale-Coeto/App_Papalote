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
            logoFileName: "pertenezco"
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
            logoFileName: "soy"
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
            logoFileName: "comunico"
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
            logoFileName: "expreso"
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
            logoFileName: "comprendo"
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
            logoFileName: "pequeños"
        )
    ]
    
    @Environment(\.modelContext) private var context
    let visita: Visita
    @Binding var answers: [Int: Int]
        
        private func getTopZonaResultado() -> ZonaResultadoQuiz? {
            if let (id, _) = answers.max(by: { $0.value < $1.value }) {
                return mockZonaResultados.first(where: { $0.id == id })
            }
            return nil
        }
        
        private func getOrderString() -> String {
            let orderedZonas = answers.sorted(by: { $0.value > $1.value }).compactMap { pair in
                mockZonaResultados.first(where: { $0.id == pair.key })?.nombre
            }
            return orderedZonas.joined(separator: " ")
        }
        
        private func updateVisitaOrder() {
            visita.orden = getOrderString() // Update 'orden'
            do {
                try context.save() // Save changes to the database
            } catch {
                print("Error saving visita orden: \(error)")
            }
        }
        
    var body: some View {
            if let topZona = getTopZonaResultado() {
                NavigationStack {
                    ZStack {
                        Color.AppColors.FondoAzulClaro
                            .ignoresSafeArea()
                        VStack {
                            Text(topZona.nombre)
                                .font(Font.custom("VagRoundedBold", size: 60))
                                .foregroundColor(topZona.color)
                                .padding(.top, 60)
                            
                            Image(uiImage: topZona.logo)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 225)
                            Spacer()
                            HStack {
                                Text("Tu zona es")
                                    .font(Font.custom("VagRounded-Ligth", size: 20))
                                Text(topZona.nombre)
                                    .font(Font.custom("VagRoundedBold", size: 20))
                                    .foregroundStyle(topZona.color)
                            }
                            .padding(.bottom)
                            Text(topZona.descripcion)
                                .font(Font.custom("VagRounded-Light", size: 18))
                                .multilineTextAlignment(.center)
                                .frame(maxWidth: .infinity)
                            Spacer()
                            NavigationLink(destination: MainView(visita: visita)) { // Use updated visita
                                ZStack {
                                    RoundedRectangle(cornerRadius: 20)
                                        .frame(width: 220, height: 58)
                                        .foregroundStyle(topZona.color)
                                    Text("Continuar")
                                        .font(Font.custom("VagRoundedBold", size: 24))
                                        .foregroundStyle(Color.init(hex: "#ffffff"))
                                }
                            }
                            .padding(.bottom, 60)
                            .onAppear {
                                updateVisitaOrder() // Update and save when view appears
                            }
                        }
                    }
                }
            } else {
                Text("No results found.")
            }
        }
    }

#Preview {
    QuizCompletedView(visita: Visita(id: 1, date: Date(), orden: "Pertenezco Comunico Comprendo Soy Expreso Pequeño"), answers: .constant([2: 0]))
        .modelContainer(for: [Zona.self, InsigniaObtenida.self, Insignia.self, Evento.self, Visita.self, Foto.self, Exhibicion.self], inMemory: true)
}
