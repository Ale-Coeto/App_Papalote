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
            Visita(id: 1, date: Date(), orden: "")
        ]
        
        let insigniasObtenidas = [
            InsigniaObtenida(id: 1, visitaId: 1)
        ]
        
        let insignias = [
            Insignia(id: 1, nombre: "Eco Guerrero", fotoUrl: "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png", zonaId: 1, eventoId: -1, descripcion: "Insignia por promover acciones ecológicas", nfcId: 1),
            Insignia(id: 2, nombre: "Protector del Bosque", fotoUrl: "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png", zonaId: 1, eventoId: -1, descripcion: "Insignia por proteger los recursos naturales", nfcId: 1),
            Insignia(id: 3, nombre: "Amigo de la Tierra", fotoUrl: "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png", zonaId: 1, eventoId: -1, descripcion: "Insignia por cuidar la biodiversidad", nfcId: 1),
            Insignia(id: 4, nombre: "Héroe Sustentable", fotoUrl: "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png", zonaId: 1, eventoId: -1, descripcion: "Insignia por promover la sustentabilidad", nfcId: 1),
            Insignia(id: 5, nombre: "Defensor del Clima", fotoUrl: "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png", zonaId: 1, eventoId: -1, descripcion: "Insignia por reducir la huella de carbono", nfcId: 1),
            Insignia(id: 6, nombre: "Guardián del Futuro", fotoUrl: "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png", zonaId: 1, eventoId: -1, descripcion: "Insignia por cuidar el planeta para futuras generaciones", nfcId: 1),
            
            Insignia(id: 7, nombre: "Explorador del Aire", fotoUrl: "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png", zonaId: 2, eventoId: -1, descripcion: "Insignia por realizar actividades al aire libre", nfcId: 1),
            Insignia(id: 8, nombre: "Viajero Sostenible", fotoUrl: "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png", zonaId: 2, eventoId: -1, descripcion: "Insignia por reducir el impacto ambiental durante viajes", nfcId: 1),
            Insignia(id: 9, nombre: "Guía de la Naturaleza", fotoUrl: "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png", zonaId: 2, eventoId: -1, descripcion: "Insignia por enseñar a otros sobre la preservación", nfcId: 1),
            Insignia(id: 10, nombre: "Aventurero Verde", fotoUrl: "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png", zonaId: 2, eventoId: -1, descripcion: "Insignia por explorar sin dañar el entorno natural", nfcId: 1),
            Insignia(id: 11, nombre: "Vigilante del Cielo", fotoUrl: "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png", zonaId: 2, eventoId: -1, descripcion: "Insignia por monitorear la calidad del aire", nfcId: 1),
            
            Insignia(id: 12, nombre: "Constructor Ecológico", fotoUrl: "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png", zonaId: 3, eventoId: -1, descripcion: "Insignia por construir usando materiales sostenibles", nfcId: 1),
            Insignia(id: 13, nombre: "Arquitecto Verde", fotoUrl: "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png", zonaId: 3, eventoId: -1, descripcion: "Insignia por diseñar proyectos eco-amigables", nfcId: 1),
            Insignia(id: 14, nombre: "Innovador Sustentable", fotoUrl: "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png", zonaId: 3, eventoId: -1, descripcion: "Insignia por crear soluciones ecológicas innovadoras", nfcId: 1),
            
            Insignia(id: 15, nombre: "Guardián de los Mares", fotoUrl: "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png", zonaId: 4, eventoId: -1, descripcion: "Insignia por proteger los ecosistemas marinos", nfcId: 1),
            Insignia(id: 16, nombre: "Navegante Sostenible", fotoUrl: "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png", zonaId: 4, eventoId: -1, descripcion: "Insignia por viajar responsablemente por el océano", nfcId: 1),
            Insignia(id: 17, nombre: "Aliado del Océano", fotoUrl: "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png", zonaId: 4, eventoId: -1, descripcion: "Insignia por limpiar playas y costas", nfcId: 1),
            Insignia(id: 18, nombre: "Defensor de los Arrecifes", fotoUrl: "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png", zonaId: 4, eventoId: -1, descripcion: "Insignia por proteger los arrecifes de coral", nfcId: 1),
            Insignia(id: 19, nombre: "Guardacostas Verde", fotoUrl: "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png", zonaId: 4, eventoId: -1, descripcion: "Insignia por preservar la fauna marina", nfcId: 1),
            Insignia(id: 20, nombre: "Marinero Ecológico", fotoUrl: "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png", zonaId: 4, eventoId: -1, descripcion: "Insignia por promover el transporte marino limpio", nfcId: 1),
            Insignia(id: 21, nombre: "Protector de las Aguas", fotoUrl: "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png", zonaId: 4, eventoId: -1, descripcion: "Insignia por monitorear la salud de los océanos", nfcId: 1),
            
            Insignia(id: 22, nombre: "Cosechador Orgánico", fotoUrl: "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png", zonaId: 5, eventoId: -1, descripcion: "Insignia por promover la agricultura orgánica", nfcId: 1),
            Insignia(id: 23, nombre: "Granjero Ecológico", fotoUrl: "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png", zonaId: 5, eventoId: -1, descripcion: "Insignia por cuidar el suelo y los cultivos sostenibles", nfcId: 1),
            Insignia(id: 24, nombre: "Defensor del Agro", fotoUrl: "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png", zonaId: 5, eventoId: -1, descripcion: "Insignia por proteger la biodiversidad en la agricultura", nfcId: 1),
            Insignia(id: 25, nombre: "Sembrador Verde", fotoUrl: "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png", zonaId: 5, eventoId: -1, descripcion: "Insignia por prácticas de siembra responsables", nfcId: 1),
            Insignia(id: 26, nombre: "Recolector Responsable", fotoUrl: "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png", zonaId: 5, eventoId: -1, descripcion: "Insignia por recolectar de manera sustentable", nfcId: 1),
            Insignia(id: 27, nombre: "Cuidador del Ecosistema", fotoUrl: "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png", zonaId: 6, eventoId: -1, descripcion: "Insignia por preservar el equilibrio ecológico", nfcId: 1),
            Insignia(id: 28, nombre: "Guardabosques Responsable", fotoUrl: "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png", zonaId: 6, eventoId: -1, descripcion: "Insignia por proteger los bosques y selvas", nfcId: 1),
            Insignia(id: 29, nombre: "Líder Ambiental", fotoUrl: "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png", zonaId: 6, eventoId: -1, descripcion: "Insignia por liderar proyectos de conservación ambiental", nfcId: 1),
            Insignia(id: 30, nombre: "Embajador Sostenible", fotoUrl: "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png", zonaId: -1, eventoId: 1, descripcion: "Insignia por representar la causa ecológica a nivel global", nfcId: 1),
            Insignia(id: 31, nombre: "Innovador Verde", fotoUrl: "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png", zonaId: -1, eventoId: 1, descripcion: "Insignia por desarrollar soluciones tecnológicas verdes", nfcId: 1),
            Insignia(id: 32, nombre: "Conservacionista del Futuro", fotoUrl: "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png", zonaId: -1, eventoId: 1, descripcion: "Insignia por esfuerzos en la conservación de la naturaleza", nfcId: 1)
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

