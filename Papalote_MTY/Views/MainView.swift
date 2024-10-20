//
//  ContentView.swift
//  Papalote_MTY
//
//  Created by Alejandra Coeto on 14/10/24.
//

import SwiftUI
import SwiftData

struct MainView: View {
    @Environment(\.modelContext)private var context
    // ASI Consigues una lista de zonas
    @Query private var items: [Zona]
    var body: some View {
        NavigationView()
            .onAppear{
                MockDataManager.addMockData(to: context)
            }
    }
}

#Preview {
    MainView()
        .modelContainer(for: [Zona.self, InsigniaObtenida.self, Insignia.self, Evento.self, Visita.self, Foto.self, Exhibicion.self], inMemory: true)
}
