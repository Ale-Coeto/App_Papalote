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

        // START OF IMAGE WORKAROUND
        let existingFotos = try? context.fetch(FetchDescriptor<Foto>())
        let existingFotoIDs = existingFotos?.map { $0.id } ?? []


        var fotos: [Foto] = []

        let totalZonas = 6  // Total number of zonas
        let fotosPorZona = 3  // Number of photos per zona
        var fotoId = 1  // Initialize the fotoId counter

        // Populate fotos with 20 visits
        for idVisita in 1...20 {
            for idZona in 1...totalZonas {
                for _ in 0..<fotosPorZona {
                    let foto = Foto(
                        id: fotoId, idZona: idZona, idVisita: idVisita,
                        imagen: nil, completado: false)
                    fotos.append(foto)
                    fotoId += 1  // Increment the fotoId for the next photo
                }
            }
        }

        // Add Fotos
        for foto in fotos {
            if !existingFotoIDs.contains(foto.id) {
                context.insert(foto)
            }
        }
        // END OF IMAGE WORKAROUND

        // Check if there is data available
        let existingZonas = try? context.fetch(FetchDescriptor<Zona>())

        // If there is data available, skip (must occur when navigating from a view that fetched the info)
        if let zonasCount = existingZonas?.count {
            if zonasCount == 0 {
                addLocalData(to: context)
            }
        } else {
            // Otherwise, add mock data to the context (must occur when db is wiped or when in preview)
            addLocalData(to: context)
        }
        
        // Literalmente Solo borraba todos los eventos jajaj
        /*
        let existingEventos = try? context.fetch(FetchDescriptor<Evento>())
        existingEventos?.forEach { context.delete($0) }
         */
    }
    //static func addMockData(to context: ModelContext){}
    static func addLocalData(to context: ModelContext) {
        let zonas = hardCodedZones()
        let eventos = hardCodedEvents()
        let insignias = hardCodedInsignia()
        let exhibiciones = hardCodedExhibiciones()
        let pines = hardCodedPines()
        let preguntas = hardCodedPreguntas()
        let respuestas = hardCodedRespuestas()
        
        for zona in zonas {
            context.insert(zona)
        }
       
        for evento in eventos {
            context.insert(evento)
        }
        
        for insignia in insignias {
            context.insert(insignia)
        }
        
        for exhibicion in exhibiciones {
            context.insert(exhibicion)
        }
    
        for pin in pines {
            context.insert(pin)
        }
        
        for pregunta in preguntas {
            context.insert(pregunta)
        }
        
        for respuesta in respuestas {
            context.insert(respuesta)
        }
        
        do {
            try context.save()
        } catch {
            print("Error saving local data \(error)")
        }
        
    }

}

func hardCodedInsignia() -> [Insignia] {
    return [
        Insignia(
            id: 1, idZona: 1, idEvento: -1, nombre: "Eco Guerrero",
            imagen:
                "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png",
            descripcion: "Insignia por promover acciones ecológicas",
            completado: false, idNFC: "1"),
        Insignia(
            id: 2, idZona: 1, idEvento: -1, nombre: "Protector del Bosque",
            imagen:
                "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png",
            descripcion: "Insignia por proteger los recursos naturales",
            completado: false, idNFC: "1"),
        Insignia(
            id: 3, idZona: 1, idEvento: -1, nombre: "Amigo de la Tierra",
            imagen:
                "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png",
            descripcion: "Insignia por cuidar la biodiversidad",
            completado: false, idNFC: "1"),
        Insignia(
            id: 4, idZona: 1, idEvento: -1, nombre: "Héroe Sustentable",
            imagen:
                "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png",
            descripcion: "Insignia por promover la sustentabilidad",
            completado: false, idNFC: "1"),
        Insignia(
            id: 5, idZona: 1, idEvento: -1, nombre: "Defensor del Clima",
            imagen:
                "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png",
            descripcion: "Insignia por reducir la huella de carbono",
            completado: false, idNFC: "1"),
        Insignia(
            id: 6, idZona: 1, idEvento: -1, nombre: "Guardián del Futuro",
            imagen:
                "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png",
            descripcion:
                "Insignia por cuidar el planeta para futuras generaciones",
            completado: false, idNFC: "1"),

        Insignia(
            id: 7, idZona: 2, idEvento: -1, nombre: "Explorador del Aire",
            imagen:
                "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png",
            descripcion: "Insignia por realizar actividades al aire libre",
            completado: false, idNFC: "1"),
        Insignia(
            id: 8, idZona: 2, idEvento: -1, nombre: "Viajero Sostenible",
            imagen:
                "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png",
            descripcion:
                "Insignia por reducir el impacto ambiental durante viajes",
            completado: false, idNFC: "1"),
        Insignia(
            id: 9, idZona: 2, idEvento: -1, nombre: "Guía de la Naturaleza",
            imagen:
                "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png",
            descripcion: "Insignia por enseñar a otros sobre la preservación",
            completado: false, idNFC: "1"),
        Insignia(
            id: 10, idZona: 2, idEvento: -1, nombre: "Aventurero Verde",
            imagen:
                "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png",
            descripcion: "Insignia por explorar sin dañar el entorno natural",
            completado: false, idNFC: "1"),
        Insignia(
            id: 11, idZona: 2, idEvento: -1, nombre: "Vigilante del Cielo",
            imagen:
                "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png",
            descripcion: "Insignia por monitorear la calidad del aire",
            completado: false, idNFC: "1"),

        Insignia(
            id: 12, idZona: 3, idEvento: -1, nombre: "Constructor Ecológico",
            imagen:
                "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png",
            descripcion: "Insignia por construir usando materiales sostenibles",
            completado: false, idNFC: "1"),
        Insignia(
            id: 13, idZona: 3, idEvento: -1, nombre: "Arquitecto Verde",
            imagen:
                "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png",
            descripcion: "Insignia por diseñar proyectos eco-amigables",
            completado: false, idNFC: "1"),
        Insignia(
            id: 14, idZona: 3, idEvento: -1, nombre: "Innovador Sustentable",
            imagen:
                "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png",
            descripcion: "Insignia por crear soluciones ecológicas innovadoras",
            completado: false, idNFC: "1"),

        Insignia(
            id: 15, idZona: 4, idEvento: -1, nombre: "Guardián de los Mares",
            imagen:
                "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png",
            descripcion: "Insignia por proteger los ecosistemas marinos",
            completado: false, idNFC: "1"),
        Insignia(
            id: 16, idZona: 4, idEvento: -1, nombre: "Navegante Sostenible",
            imagen:
                "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png",
            descripcion: "Insignia por viajar responsablemente por el océano",
            completado: false, idNFC: "1"),
        Insignia(
            id: 17, idZona: 4, idEvento: -1, nombre: "Aliado del Océano",
            imagen:
                "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png",
            descripcion: "Insignia por limpiar playas y costas",
            completado: false, idNFC: "1"),
        Insignia(
            id: 18, idZona: 4, idEvento: -1,
            nombre: "Defensor de los Arrecifes",
            imagen:
                "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png",
            descripcion: "Insignia por proteger los arrecifes de coral",
            completado: false, idNFC: "1"),
        Insignia(
            id: 19, idZona: 4, idEvento: -1, nombre: "Guardacostas Verde",
            imagen:
                "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png",
            descripcion: "Insignia por preservar la fauna marina",
            completado: false, idNFC: "1"),
        Insignia(
            id: 20, idZona: 4, idEvento: -1, nombre: "Cuidadores del Océano",
            imagen:
                "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png",
            descripcion: "Insignia por iniciativas de conservación marina",
            completado: false, idNFC: "1"),

        Insignia(
            id: 21, idZona: 5, idEvento: -1, nombre: "Guardianes del Hábitat",
            imagen:
                "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png",
            descripcion: "Insignia por la preservación del hábitat natural",
            completado: false, idNFC: "1"),
        Insignia(
            id: 22, idZona: 5, idEvento: -1, nombre: "Defensores de la Fauna",
            imagen:
                "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png",
            descripcion: "Insignia por proteger especies en peligro",
            completado: false, idNFC: "1"),
        Insignia(
            id: 23, idZona: 5, idEvento: -1, nombre: "Activista Ecológico",
            imagen:
                "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png",
            descripcion: "Insignia por involucrarse en causas ambientales",
            completado: false, idNFC: "1"),
        Insignia(
            id: 24, idZona: 5, idEvento: -1, nombre: "Conciencia Verde",
            imagen:
                "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png",
            descripcion: "Insignia por educar a otros sobre sostenibilidad",
            completado: false, idNFC: "1"),
        Insignia(
            id: 25, idZona: 5, idEvento: -1, nombre: "Embajador Ecológico",
            imagen:
                "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png",
            descripcion: "Insignia por representar iniciativas ecológicas",
            completado: false, idNFC: "1"),

        Insignia(
            id: 26, idZona: 6, idEvento: -1, nombre: "Iniciativa Verde",
            imagen:
                "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png",
            descripcion: "Insignia por crear proyectos ecológicos comunitarios",
            completado: false, idNFC: "1"),
        Insignia(
            id: 27, idZona: 6, idEvento: -1, nombre: "Voluntario Ambiental",
            imagen:
                "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png",
            descripcion: "Insignia por participar en actividades de limpieza",
            completado: false, idNFC: "1"),
        Insignia(
            id: 28, idZona: 6, idEvento: -1, nombre: "Colaborador Verde",
            imagen:
                "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png",
            descripcion: "Insignia por colaborar en proyectos de conservación",
            completado: false, idNFC: "1"),
        Insignia(
            id: 29, idZona: 6, idEvento: -1, nombre: "Embajador del Reciclaje",
            imagen:
                "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png",
            descripcion: "Insignia por fomentar el reciclaje en la comunidad",
            completado: false, idNFC: "1"),
        Insignia(
            id: 30, idZona: 6, idEvento: -1, nombre: "Defensor de la Tierra",
            imagen:
                "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png",
            descripcion: "Insignia por proteger el medio ambiente",
            completado: false, idNFC: "1"),
        Insignia(
            id: 31, idZona: 6, idEvento: -1, nombre: "Caminante del Planeta",
            imagen:
                "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png",
            descripcion: "Insignia por cuidar cada rincón del planeta",
            completado: false, idNFC: "1"),
        Insignia(
            id: 32, idZona: 6, idEvento: -1, nombre: "Héroe de la Naturaleza",
            imagen:
                "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png",
            descripcion:
                "Insignia por acciones heroicas en pro de la naturaleza",
            completado: false, idNFC: "1"),
        Insignia(
            id: 33, idZona: 0, idEvento: 1, nombre: "Iniciativa Verde",
            imagen:
                "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png",
            descripcion: "Insignia por crear proyectos ecológicos comunitarios",
            completado: false, idNFC: "1"),
        Insignia(
            id: 34, idZona: 0, idEvento: 1, nombre: "Voluntario Ambiental",
            imagen:
                "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png",
            descripcion: "Insignia por participar en actividades de limpieza",
            completado: false, idNFC: "1"),
        Insignia(
            id: 35, idZona: 0, idEvento: 1, nombre: "Colaborador Verde",
            imagen:
                "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png",
            descripcion: "Insignia por colaborar en proyectos de conservación",
            completado: false, idNFC: "1"),
        Insignia(
            id: 36, idZona: 0, idEvento: 1, nombre: "Embajador del Reciclaje",
            imagen:
                "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png",
            descripcion: "Insignia por fomentar el reciclaje en la comunidad",
            completado: false, idNFC: "1"),
        Insignia(
            id: 37, idZona: 0, idEvento: 1, nombre: "Defensor de la Tierra",
            imagen:
                "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png",
            descripcion: "Insignia por proteger el medio ambiente",
            completado: false, idNFC: "1"),
        Insignia(
            id: 38, idZona: 0, idEvento: 1, nombre: "Caminante del Planeta",
            imagen:
                "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png",
            descripcion: "Insignia por cuidar cada rincón del planeta",
            completado: false, idNFC: "1"),
        Insignia(
            id: 39, idZona: 0, idEvento: 1, nombre: "Héroe de la Naturaleza",
            imagen:
                "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png",
            descripcion:
                "Insignia por acciones heroicas en pro de la naturaleza",
            completado: false, idNFC: "1"),
    ]
}

func hardCodedZones() -> [Zona] {
    return [
        Zona(
            id: 1, nombre: "Pertenezco",
            descripcion:
                "Zona que te invita a comunicar tus ideas para mejorar el medio ambiente. ",
            color: "#C4D600", logo: "LogoPertenezco"),
        Zona(
            id: 2, nombre: "Comunico",
            descripcion:
                "Poco a poco te darás cuenta de que pertenecemos a una gran red de vida en la que todo se relaciona para funcionar. ",
            color: "#006BA6", logo: "LogoComunico"),
        Zona(
            id: 3, nombre: "Comprendo",
            descripcion:
                "Aquí en la zona científica entenderás cómo funciona nuestro planeta y cómo podemos cuidarlo a través de la ciencia. ",
            color: "#84329B", logo: "LogoComprendo"),
        Zona(
            id: 4, nombre: "Soy",
            descripcion:
                "Aquí, te darás cuenta de que las decisiones que tomes día a día, pueden dañar o mejorar al medio ambiente.",
            color: "#D50032", logo: "LogoSoy"),
        Zona(
            id: 5, nombre: "Expreso",
            descripcion:
                "Es una oportunidad para poder expresar todos los sentimientos y emociones que te produce la naturaleza, y qué mejor manera que a través del arte.",
            color: "#FF8200", logo: "LogoExpreso"),
        Zona(
            id: 6, nombre: "Pequeños",
            descripcion:
                "Zona reservada para los niños menores de 5 años. Los pequeños jugarán en un ambiente inspirado en la naturaleza, ya sea en el bosque o en el mar. ",
            color: "#009CA6", logo: "LogoPequenos"),
    ]
}

func hardCodedPines() -> [Pin] {
    return [
        Pin(
            id: 1, idZona: 1, x: 730, y: 360, floor: 1, color: "#476ADC",
            icon: "leaf", nombre: "Pertenezco"),
        Pin(
            id: 2, idZona: 2, x: 560, y: 500, floor: 1, color: "#476ADC",
            icon: "phone", nombre: "Comunico"),
        Pin(
            id: 3, idZona: 3, x: 0, y: 0, floor: 2, color: "#476ADC",
            icon: "testtube.2", nombre: "Comprendo"),
        Pin(
            id: 4, idZona: 4, x: 0, y: 0, floor: 2, color: "#476ADC",
            icon: "sun.max", nombre: "Soy"),
        Pin(
            id: 5, idZona: 5, x: 0, y: 0, floor: 2, color: "#476ADC",
            icon: "paintbrush", nombre: "Expreso"),
        Pin(
            id: 6, idZona: 6, x: 800, y: 660, floor: 1, color: "#476ADC",
            icon: "figure.child", nombre: "Pequeños"),
        Pin(
            id: 7, idZona: 100, x: 300, y: 380, floor: 1, color: "#DCBA4F",
            icon: "toilet", nombre: "Baños"),
        Pin(
            id: 8, idZona: 100, x: 340, y: 300, floor: 1, color: "#DB4B3D",
            icon: "storefront", nombre: "Tienda"),
    ]
}

func hardCodedEvents() -> [Evento] {
    return [
        Evento(
            id: 1, fechaInicio: Date(), fechaFin: Date(),
            nombre: "Semana Cosmica", descripcion: "dia del espacio",
            imagen:
                "https://d20ohkaloyme4g.cloudfront.net/img/document_thumbnails/a0b8d1f7b02a075564ed58d2c9a31d9d/thumb_1200_3000.png"
        )
    ]
}

func hardCodedExhibiciones() -> [Exhibicion] {
    return [
        // Zona 1
        Exhibicion(
            id: 1, idZona: 1, nombre: "Exploración Espacial",
            descripcion:
                "Un recorrido por la historia de la exploración espacial y sus logros.",
            completado: false,
            imagen: "https://i.ibb.co/RzQd3tm/Space-Exploration.jpg",
            isOpen: true, location: "Sala del Espacio"),
        Exhibicion(
            id: 2, idZona: 1, nombre: "Robótica Interactiva",
            descripcion:
                "Exposición interactiva con robots y tecnología avanzada.",
            completado: false,
            imagen: "https://i.ibb.co/YZb9rgw/Interactive-Robotics.jpg",
            isOpen: true, location: "Sala de Tecnología"),
        Exhibicion(
            id: 3, idZona: 1, nombre: "Aventuras Dinámicas",
            descripcion:
                "Una serie de desafíos interactivos para explorar conceptos de física y movimiento.",
            completado: false,
            imagen: "https://i.ibb.co/B3tzfj8/Dynamic-Adventures.jpg",
            isOpen: true, location: "Sala de Movimiento"),

        // Zona 2
        Exhibicion(
            id: 4, idZona: 2, nombre: "Ecosistemas de México",
            descripcion:
                "Explora los ecosistemas diversos de México y sus especies.",
            completado: false,
            imagen: "https://i.ibb.co/X5xM39T/Ecosystemsof-Mexico.jpg",
            isOpen: true, location: "Sala de Biodiversidad"),
        Exhibicion(
            id: 5, idZona: 2, nombre: "El Mundo del Agua",
            descripcion:
                "Una exhibición sobre el ciclo del agua y su importancia en el planeta.",
            completado: false,
            imagen: "https://i.ibb.co/WnCpT9r/The-Worldof-Water.jpg",
            isOpen: true, location: "Sala del Agua"),
        Exhibicion(
            id: 6, idZona: 2, nombre: "Misterios del Océano",
            descripcion:
                "Sumérgete en los secretos del océano y sus criaturas marinas.",
            completado: false,
            imagen: "https://i.ibb.co/YQwJtqp/Ocean-Mysteries.jpg",
            isOpen: true, location: "Sala del Océano"),

        // Zona 3
        Exhibicion(
            id: 7, idZona: 3, nombre: "Los Sentidos",
            descripcion:
                "Descubre cómo funcionan nuestros sentidos y explóralos a través de experimentos.",
            completado: false,
            imagen: "https://i.ibb.co/j6VVzf1/The-Senses.jpg", isOpen: true,
            location: "Sala de los Sentidos"),
        Exhibicion(
            id: 8, idZona: 3, nombre: "El Cuerpo Humano",
            descripcion:
                "Explora la anatomía humana con modelos y actividades interactivas.",
            completado: false,
            imagen: "https://i.ibb.co/m0tsDHH/The-Human-Body.jpg", isOpen: true,
            location: "Sala de Anatomía"),
        Exhibicion(
            id: 9, idZona: 3, nombre: "Cómo Funciona la Mente",
            descripcion:
                "Una exploración de la psicología y las emociones humanas.",
            completado: false,
            imagen: "https://i.ibb.co/bvhB3T1/Howthe-Mind-Works.jpg",
            isOpen: true, location: "Sala de la Mente"),

        // Zona 4
        Exhibicion(
            id: 10, idZona: 4, nombre: "Vida de los Dinosaurios",
            descripcion:
                "Un viaje en el tiempo para conocer cómo vivían los dinosaurios.",
            completado: false,
            imagen: "https://i.ibb.co/gJBVprP/Lifeof-Dinosaurs.jpg",
            isOpen: true, location: "Sala de Dinosaurios"),
        Exhibicion(
            id: 11, idZona: 4, nombre: "Fósiles y Minerales",
            descripcion:
                "Descubre el mundo de los fósiles y la formación de minerales.",
            completado: false,
            imagen: "https://i.ibb.co/ZVbjtS9/Fossilsand-Minerals.jpg",
            isOpen: true, location: "Sala de Geología"),
        Exhibicion(
            id: 12, idZona: 4, nombre: "Los Primeros Humanos",
            descripcion: "Explora los inicios de la humanidad y la evolución.",
            completado: false,
            imagen: "https://i.ibb.co/gy2bVzr/The-First-Humans.jpg",
            isOpen: true, location: "Sala de Antropología"),

        // Zona 5
        Exhibicion(
            id: 13, idZona: 5, nombre: "El Arte de la Luz",
            descripcion:
                "Exposición interactiva que explora cómo funciona la luz y sus efectos.",
            completado: false,
            imagen: "https://i.ibb.co/FBVjDps/The-Artof-Light.jpg",
            isOpen: true, location: "Sala de Luz"),
        Exhibicion(
            id: 14, idZona: 5, nombre: "El Mundo de la Electricidad",
            descripcion:
                "Actividades sobre el funcionamiento y la historia de la electricidad.",
            completado: false,
            imagen: "https://i.ibb.co/2WZ7SfH/The-Worldof-Electricity.jpg",
            isOpen: true, location: "Sala de Electricidad"),
        Exhibicion(
            id: 15, idZona: 5, nombre: "Matemáticas en Acción",
            descripcion:
                "Interactúa con conceptos matemáticos de manera divertida y práctica.",
            completado: false,
            imagen: "https://i.ibb.co/qYCLH34/Mathematicsin-Action.jpg",
            isOpen: true, location: "Sala de Matemáticas"),

        // Zona 6
        Exhibicion(
            id: 16, idZona: 6, nombre: "Comunicación a través del Tiempo",
            descripcion:
                "Explora cómo ha evolucionado la comunicación a lo largo de la historia.",
            completado: false,
            imagen: "https://i.ibb.co/KVY3xpp/Communicationthrough-Time.jpg",
            isOpen: true, location: "Sala de Comunicación"),
        Exhibicion(
            id: 17, idZona: 6, nombre: "Transporte y Movilidad",
            descripcion:
                "Descubre la evolución del transporte a través de los tiempos.",
            completado: false,
            imagen: "https://i.ibb.co/Q9N136c/Transportationand-Mobility.jpg",
            isOpen: true, location: "Sala de Transporte"),
        Exhibicion(
            id: 18, idZona: 6, nombre: "Energía Sostenible",
            descripcion:
                "Conoce los avances y beneficios de las energías renovables.",
            completado: false,
            imagen: "https://i.ibb.co/T4WChBm/Sustainable-Energy.jpg",
            isOpen: true, location: "Sala de Energía Renovable"),
    ]
}

func hardCodedPreguntas() -> [Pregunta] {
    return [
        Pregunta(id: 1, pregunta: "De estos colores, ¿cuál es el que más te gusta?"),
        Pregunta(id: 2, pregunta: "¿Qué género de película disfrutas más?"),
        Pregunta(id: 3, pregunta: "¿Qué le dirías a tu niño interior?"),
        Pregunta(id: 4, pregunta: "¿Con qué frase te identificas más?"),
        Pregunta(id: 5, pregunta: "¿Qué pasatiempo prefieres?"),
        Pregunta(id: 6, pregunta: "¿Cuál es tu género musical favorito?"),
        Pregunta(id: 7, pregunta: "¿Cuál tema te gusta más?")
    ]
}

func hardCodedRespuestas() -> [Respuesta] {
    return [
        // Pregunta 1: "De estos colores, ¿cuál es el que más te gusta?"
        Respuesta(id: 1, idZona: 1, idPregunta: 1, respuesta: "Verde"),
        Respuesta(id: 2, idZona: 4, idPregunta: 1, respuesta: "Rojo"),
        Respuesta(id: 3, idZona: 2, idPregunta: 1, respuesta: "Azul"),
        Respuesta(id: 4, idZona: 5, idPregunta: 1, respuesta: "Naranja"),
        Respuesta(id: 5, idZona: 3, idPregunta: 1, respuesta: "Morado"),
        Respuesta(id: 6, idZona: 6, idPregunta: 1, respuesta: "Celeste"),
        
        // Pregunta 2: "¿Qué género de película disfrutas más?"
        Respuesta(id: 7, idZona: 1, idPregunta: 2, respuesta: "Cualquier género está bien"),
        Respuesta(id: 8, idZona: 4, idPregunta: 2, respuesta: "Acción"),
        Respuesta(id: 9, idZona: 2, idPregunta: 2, respuesta: "Comedia"),
        Respuesta(id: 10, idZona: 5, idPregunta: 2, respuesta: "Fantasía"),
        Respuesta(id: 11, idZona: 3, idPregunta: 2, respuesta: "Ciencia ficción"),
        Respuesta(id: 12, idZona: 6, idPregunta: 2, respuesta: "Animadas"),
        
        // Pregunta 3: "¿Qué le dirías a tu niño interior?"
        Respuesta(id: 13, idZona: 1, idPregunta: 3, respuesta: "La flor que florece en la adversidad es la más rara y hermosa de todas."),
        Respuesta(id: 14, idZona: 4, idPregunta: 3, respuesta: "No todas las decisiones tienen que ser perfectas, a veces lo que importa es intentarlo."),
        Respuesta(id: 15, idZona: 2, idPregunta: 3, respuesta: "Tienes una voz única, y el mundo necesita escucharla."),
        Respuesta(id: 16, idZona: 5, idPregunta: 3, respuesta: "Sabes que en caso de no tener música de fondo, tú puedes crear la tuya."),
        Respuesta(id: 17, idZona: 3, idPregunta: 3, respuesta: "Comprenderte a ti mismo es el primer paso para comprender a los demás."),
        Respuesta(id: 18, idZona: 6, idPregunta: 3, respuesta: "Gracias por esta aventura, ahora me toca vivir una nueva."),
        
        // Pregunta 4: "¿Con qué frase te identificas más?"
        Respuesta(id: 19, idZona: 1, idPregunta: 4, respuesta: "“Mira profundamente en la naturaleza y entonces comprenderás todo mejor” (Albert Einstein)."),
        Respuesta(id: 20, idZona: 4, idPregunta: 4, respuesta: "“Eres lo que haces, no lo que dices que harás.” (Carl Jung)."),
        Respuesta(id: 21, idZona: 2, idPregunta: 4, respuesta: "“Cuando cambiamos la forma en que nos comunicamos, cambiamos la sociedad.” (Clay Shirky)."),
        Respuesta(id: 22, idZona: 5, idPregunta: 4, respuesta: "“La vida es un lienzo en blanco, y debes lanzar sobre él toda la pintura que puedas.” (Danny Kaye)."),
        Respuesta(id: 23, idZona: 3, idPregunta: 4, respuesta: "“Lo que conocemos es una gota, lo que no conocemos es un océano.” (Isaac Newton)."),
        Respuesta(id: 24, idZona: 6, idPregunta: 4, respuesta: "“Todas las personas mayores fueron al principio niños, aunque pocas lo recuerdan.” (Antoine de Saint-Exupéry)."),
        
        // Pregunta 5: "¿Qué pasatiempo prefieres?"
        Respuesta(id: 25, idZona: 1, idPregunta: 5, respuesta: "Disfrutar de la naturaleza."),
        Respuesta(id: 26, idZona: 4, idPregunta: 5, respuesta: "Ir de compras."),
        Respuesta(id: 27, idZona: 2, idPregunta: 5, respuesta: "Ver redes sociales."),
        Respuesta(id: 28, idZona: 5, idPregunta: 5, respuesta: "Escuchar música."),
        Respuesta(id: 29, idZona: 3, idPregunta: 5, respuesta: "Experimentar cosas nuevas."),
        Respuesta(id: 30, idZona: 6, idPregunta: 5, respuesta: "Convivir en familia."),
        
        // Pregunta 6: "¿Cuál es tu género musical favorito?"
        Respuesta(id: 31, idZona: 1, idPregunta: 6, respuesta: "Regional mexicano"),
        Respuesta(id: 32, idZona: 4, idPregunta: 6, respuesta: "Rock"),
        Respuesta(id: 33, idZona: 2, idPregunta: 6, respuesta: "Electrónica"),
        Respuesta(id: 34, idZona: 5, idPregunta: 6, respuesta: "Disfruto todos los géneros"),
        Respuesta(id: 35, idZona: 3, idPregunta: 6, respuesta: "Clásica"),
        Respuesta(id: 36, idZona: 6, idPregunta: 6, respuesta: "Pop"),
        
        // Pregunta 7: "¿Cuál tema te gusta más?"
        Respuesta(id: 37, idZona: 1, idPregunta: 7, respuesta: "Biología"),
        Respuesta(id: 38, idZona: 4, idPregunta: 7, respuesta: "Matemáticas"),
        Respuesta(id: 39, idZona: 2, idPregunta: 7, respuesta: "Tecnologías"),
        Respuesta(id: 40, idZona: 5, idPregunta: 7, respuesta: "Arte"),
        Respuesta(id: 41, idZona: 3, idPregunta: 7, respuesta: "Química"),
        Respuesta(id: 42, idZona: 6, idPregunta: 7, respuesta: "Educación física")
    ]
}
