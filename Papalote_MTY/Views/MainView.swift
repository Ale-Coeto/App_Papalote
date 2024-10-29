//
//  ContentView.swift
//  Papalote_MTY
//
//  Created by Alejandra Coeto on 14/10/24.
//

import SwiftUI
import SwiftData

struct MainView: View {
    let visita: Visita
    @Environment(\.modelContext)private var context
    // ASI Consigues una lista de zonas
    @Query private var items: [Zona]
    var body: some View {
        NavigationView(visita: visita)
            .onAppear{
                MockDataManager.addMockData(to: context)
                print(visita.orden)
            }
            .navigationBarBackButtonHidden(true)
            
    }
}

#Preview {
    MainView(visita: Visita(id: 1, date: Date(), orden: "Pequeños Comunico Comprendo Soy Expreso Pertenezco"))
        .modelContainer(for: [Zona.self, InsigniaObtenida.self, Insignia.self, Evento.self, Visita.self, Foto.self, Exhibicion.self], inMemory: true)
}
