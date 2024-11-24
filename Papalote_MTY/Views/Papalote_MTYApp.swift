//
//  Papalote_MTYApp.swift
//  Papalote_MTY
//
//  Created by Alejandra Coeto on 14/10/24.
//

import SwiftUI
import SwiftData
import UIKit

@main
struct Papalote_MTYApp: App {
    @Environment(\.modelContext) private var context
    @UIApplicationDelegateAdaptor(AppDelegate.self) private var appDelegate
    var body: some Scene {
        WindowGroup {
            SplashScreen(splasherText: " ") {
                    LandingView() // Replace LandingView() with any other view we need to
                }
        }
        .modelContainer(for: [Zona.self, InsigniaObtenida.self, Insignia.self, Evento.self, Visita.self, Foto.self, Exhibicion.self, ExhibicionObtenida.self, Pin.self, FetchedDate.self])
    }
}
