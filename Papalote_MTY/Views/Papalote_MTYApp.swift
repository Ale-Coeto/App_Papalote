//
//  Papalote_MTYApp.swift
//  Papalote_MTY
//
//  Created by Alejandra Coeto on 14/10/24.
//

import SwiftUI
import SwiftData

@main
struct Papalote_MTYApp: App {
    var body: some Scene {
        WindowGroup {
            SplashScreen()
        }
        .modelContainer(for: [Zona.self, InsigniaObtenida.self, Insignia.self, Evento.self, Visita.self])
    }
}
