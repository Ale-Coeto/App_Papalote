//
//  MockDataManager.swift
//  Papalote_MTY
//
//  Created by Rodrigo Garcia on 18/10/24.
//


//
//  MockDataManager.swift
//  Papalote_MTY
//
//  Created by Rodrigo Garcia on 18/10/24.
//

import Foundation
import SwiftData

struct MockDataManager {
    static func addMockData(to context: ModelContext) {
        let existingZonas = try? context.fetch(FetchDescriptor<Zona>())
            existingZonas?.forEach { context.delete($0) }
            
            // Fetch and delete all existing Evento objects
            let existingEventos = try? context.fetch(FetchDescriptor<Evento>())
            existingEventos?.forEach { context.delete($0) }
            
            // Fetch and delete all existing Visita objects
            let existingVisitas = try? context.fetch(FetchDescriptor<Visita>())
            existingVisitas?.forEach { context.delete($0) }
            
            // Fetch and delete all existing Insignia objects
            let existingInsignias = try? context.fetch(FetchDescriptor<Insignia>())
            existingInsignias?.forEach { context.delete($0) }
            
            // Fetch and delete all existing InsigniaObtenida objects
            let existingInsigniasObtenidas = try? context.fetch(FetchDescriptor<InsigniaObtenida>())
            existingInsigniasObtenidas?.forEach { context.delete($0) }
            
       // Define the data to add
       let zonas = [
        Zona(id: 1, nombre: "Pertenezco", descripcion: "aaaa", color: "#C4D600", logo: "Pertenezco"),
           Zona(id: 2, nombre: "Comunico", descripcion: "annn", color: "#006BA6", logo: "Comunico"),
           Zona(id: 3, nombre: "Comprendo", descripcion: "aerkljvrnea", color: "#84329B", logo: "Pertenezco"),
           Zona(id: 4, nombre: "Soy", descripcion: "aei;rj;oei", color: "#D50032" , logo: "Soy"),
           Zona(id: 5, nombre: "Expreso", descripcion: "ahvi", color: "#FF8200", logo: "Expreso"),
           Zona(id: 6, nombre: "Pequeños", descripcion: "aeoirh", color: "#009CA6", logo: "Pequeños")
       ]
       
       let eventos = [
           Evento(id: 1, fechaInicio: Date(), fechaFin: Date(), nombre: "Semana Mundial del espacio", descripcion: "dia del espacio", imagen: "a")
       ]

       let visitas = [
           Visita(id: 1, date: Date(), orden: [])
       ]

       let insigniasObtenidas = [
           InsigniaObtenida(id: 1, visitaId: 1)
       ]

       let insignias = [
           Insignia(id: 1, fotoUrl: "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png", zonaId: 1, eventoId: 1, descripcion: "no_descripcion", nfcId: 1),
           Insignia(id: 2, fotoUrl: "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png", zonaId: 1, eventoId: 1, descripcion: "no_descripcion", nfcId: 1),
           Insignia(id: 3, fotoUrl: "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png", zonaId: 1, eventoId: 1, descripcion: "no_descripcion", nfcId: 1)
       ]

       // Add Zonas
       for zona in zonas {
           context.insert(zona)
       }

       // Add Eventos
       for evento in eventos {
           context.insert(evento)
       }

       // Add Visitas
       for visita in visitas {
           context.insert(visita)
       }

       // Add InsigniasObtenidas
       for insigniaObtenida in insigniasObtenidas {
           context.insert(insigniaObtenida)
       }

       // Add Insignias
       for insignia in insignias {
           context.insert(insignia)
       }
   }
}

