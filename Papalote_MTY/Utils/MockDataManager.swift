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
        /*let existingVisitas = try? context.fetch(FetchDescriptor<Visita>())
        existingVisitas?.forEach { context.delete($0) }*/
        
        // Fetch and delete all existing Insignia objects
        let existingInsignias = try? context.fetch(FetchDescriptor<Insignia>())
        existingInsignias?.forEach { context.delete($0) }
        

        // Fetch and delete all existing Fotos objects
        let existingFotos = try? context.fetch(FetchDescriptor<Foto>())
        let existingFotoIDs = existingFotos?.map { $0.id } ?? []
        //existingFotos?.forEach { context.delete($0) }
        
        // Fetch and delete all existing Exhibicion objects
        let existingExhibicion = try? context.fetch(FetchDescriptor<Exhibicion>())
        existingExhibicion?.forEach { context.delete($0) }
        
        // Fetch and delete all existing InsigniaObtenida objects
       /* let existingInsigniasObtenidas = try? context.fetch(FetchDescriptor<InsigniaObtenida>())
        existingInsigniasObtenidas?.forEach { context.delete($0) }*/
        
        let existingPines = try? context.fetch(FetchDescriptor<Pin>())
        existingPines?.forEach { context.delete($0)}
    
        // Define the data to add
        let zonas = [
            Zona(id: 1, nombre: "Pertenezco", descripcion: "Zona que te invita a comunicar tus ideas para mejorar el medio ambiente. ", color: "#C4D600", logo: "LogoPertenezco"),
            Zona(id: 2, nombre: "Comunico", descripcion: "Poco a poco te darás cuenta de que pertenecemos a una gran red de vida en la que todo se relaciona para funcionar. ", color: "#006BA6", logo: "LogoComunico"),
            Zona(id: 3, nombre: "Comprendo", descripcion: "Aquí en la zona científica entenderás cómo funciona nuestro planeta y cómo podemos cuidarlo a través de la ciencia. ", color: "#84329B", logo: "LogoComprendo"),
            Zona(id: 4, nombre: "Soy", descripcion: "Aquí, te darás cuenta de que las decisiones que tomes día a día, pueden dañar o mejorar al medio ambiente.", color: "#D50032" , logo: "LogoSoy"),
            Zona(id: 5, nombre: "Expreso", descripcion: "Es una oportunidad para poder expresar todos los sentimientos y emociones que te produce la naturaleza, y qué mejor manera que a través del arte.", color: "#FF8200", logo: "LogoExpreso"),
            Zona(id: 6, nombre: "Pequeños", descripcion: "Zona reservada para los niños menores de 5 años. Los pequeños jugarán en un ambiente inspirado en la naturaleza, ya sea en el bosque o en el mar. ", color: "#009CA6", logo: "LogoPequenos")
        ]
        
        let pines = [
            Pin(id: 1, idZona: 1, x: 730, y: 360, floor: 1, color: "#476ADC", icon: "leaf", nombre: "Pertenezco"),
            Pin(id: 2, idZona: 2, x: 560, y: 500, floor: 1, color: "#476ADC", icon: "phone", nombre: "Comunico"),
            Pin(id: 3, idZona: 3, x: 0, y: 0, floor: 2, color: "#476ADC", icon: "testtube.2", nombre: "Comprendo"),
            Pin(id: 4, idZona: 4, x: 0, y: 0, floor: 2, color: "#476ADC", icon: "sun.max", nombre: "Soy"),
            Pin(id: 5, idZona: 5, x: 0, y: 0, floor: 2, color: "#476ADC", icon: "paintbrush", nombre: "Expreso"),
            Pin(id: 6, idZona: 6, x: 800, y: 660, floor: 1, color: "#476ADC", icon: "figure.child", nombre: "Pequeños"),
            Pin(id: 7, idZona: 100, x: 300, y: 380, floor: 1, color: "#DCBA4F", icon: "toilet", nombre: "Baños"),
            Pin(id: 8, idZona: 100, x: 340, y: 300, floor: 1, color: "#DB4B3D", icon: "storefront", nombre: "Tienda")
        ]
        
        
        let eventos = [
            Evento(id: 1, fechaInicio: Date(), fechaFin: Date(), nombre: "Semana Cosmica", descripcion: "dia del espacio", imagen: "https://d20ohkaloyme4g.cloudfront.net/img/document_thumbnails/a0b8d1f7b02a075564ed58d2c9a31d9d/thumb_1200_3000.png")
        ]
        
        let visitas = [
            Visita(id: 1, date: Date(), orden: "")
        ]
        
        /*let insigniasObtenidas = [
            InsigniaObtenida(id: 1, visitaId: 1)
        ]*/
        
        let insignias = [
            Insignia(id: 1, idZona: 1, idEvento: -1, nombre: "Eco Guerrero", imagen: "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png", descripcion: "Insignia por promover acciones ecológicas", completado: false, idNFC: 1),
            Insignia(id: 2, idZona: 1, idEvento: -1, nombre: "Protector del Bosque", imagen: "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png", descripcion: "Insignia por proteger los recursos naturales", completado: false, idNFC: 1),
            Insignia(id: 3, idZona: 1, idEvento: -1, nombre: "Amigo de la Tierra", imagen: "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png", descripcion: "Insignia por cuidar la biodiversidad", completado: false, idNFC: 1),
            Insignia(id: 4, idZona: 1, idEvento: -1, nombre: "Héroe Sustentable", imagen: "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png", descripcion: "Insignia por promover la sustentabilidad", completado: false, idNFC: 1),
            Insignia(id: 5, idZona: 1, idEvento: -1, nombre: "Defensor del Clima", imagen: "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png", descripcion: "Insignia por reducir la huella de carbono", completado: false, idNFC: 1),
            Insignia(id: 6, idZona: 1, idEvento: -1, nombre: "Guardián del Futuro", imagen: "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png", descripcion: "Insignia por cuidar el planeta para futuras generaciones", completado: false, idNFC: 1),
            
            Insignia(id: 7, idZona: 2, idEvento: -1, nombre: "Explorador del Aire", imagen: "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png", descripcion: "Insignia por realizar actividades al aire libre", completado: false, idNFC: 1),
            Insignia(id: 8, idZona: 2, idEvento: -1, nombre: "Viajero Sostenible", imagen: "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png", descripcion: "Insignia por reducir el impacto ambiental durante viajes", completado: false, idNFC: 1),
            Insignia(id: 9, idZona: 2, idEvento: -1, nombre: "Guía de la Naturaleza", imagen: "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png", descripcion: "Insignia por enseñar a otros sobre la preservación", completado: false, idNFC: 1),
            Insignia(id: 10, idZona: 2, idEvento: -1, nombre: "Aventurero Verde", imagen: "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png", descripcion: "Insignia por explorar sin dañar el entorno natural", completado: false, idNFC: 1),
            Insignia(id: 11, idZona: 2, idEvento: -1, nombre: "Vigilante del Cielo", imagen: "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png", descripcion: "Insignia por monitorear la calidad del aire", completado: false, idNFC: 1),
            
            Insignia(id: 12, idZona: 3, idEvento: -1, nombre: "Constructor Ecológico", imagen: "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png", descripcion: "Insignia por construir usando materiales sostenibles", completado: false, idNFC: 1),
            Insignia(id: 13, idZona: 3, idEvento: -1, nombre: "Arquitecto Verde", imagen: "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png", descripcion: "Insignia por diseñar proyectos eco-amigables", completado: false, idNFC: 1),
            Insignia(id: 14, idZona: 3, idEvento: -1, nombre: "Innovador Sustentable", imagen: "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png", descripcion: "Insignia por crear soluciones ecológicas innovadoras", completado: false, idNFC: 1),
            
            Insignia(id: 15, idZona: 4, idEvento: -1, nombre: "Guardián de los Mares", imagen: "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png", descripcion: "Insignia por proteger los ecosistemas marinos", completado: false, idNFC: 1),
            Insignia(id: 16, idZona: 4, idEvento: -1, nombre: "Navegante Sostenible", imagen: "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png", descripcion: "Insignia por viajar responsablemente por el océano", completado: false, idNFC: 1),
            Insignia(id: 17, idZona: 4, idEvento: -1, nombre: "Aliado del Océano", imagen: "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png", descripcion: "Insignia por limpiar playas y costas", completado: false, idNFC: 1),
            Insignia(id: 18, idZona: 4, idEvento: -1, nombre: "Defensor de los Arrecifes", imagen: "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png", descripcion: "Insignia por proteger los arrecifes de coral", completado: false, idNFC: 1),
            Insignia(id: 19, idZona: 4, idEvento: -1, nombre: "Guardacostas Verde", imagen: "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png", descripcion: "Insignia por preservar la fauna marina", completado: false, idNFC: 1),
            Insignia(id: 20, idZona: 4, idEvento: -1, nombre: "Cuidadores del Océano", imagen: "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png", descripcion: "Insignia por iniciativas de conservación marina", completado: false, idNFC: 1),

            Insignia(id: 21, idZona: 5, idEvento: -1, nombre: "Guardianes del Hábitat", imagen: "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png", descripcion: "Insignia por la preservación del hábitat natural", completado: false, idNFC: 1),
            Insignia(id: 22, idZona: 5, idEvento: -1, nombre: "Defensores de la Fauna", imagen: "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png", descripcion: "Insignia por proteger especies en peligro", completado: false, idNFC: 1),
            Insignia(id: 23, idZona: 5, idEvento: -1, nombre: "Activista Ecológico", imagen: "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png", descripcion: "Insignia por involucrarse en causas ambientales", completado: false, idNFC: 1),
            Insignia(id: 24, idZona: 5, idEvento: -1, nombre: "Conciencia Verde", imagen: "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png", descripcion: "Insignia por educar a otros sobre sostenibilidad", completado: false, idNFC: 1),
            Insignia(id: 25, idZona: 5, idEvento: -1, nombre: "Embajador Ecológico", imagen: "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png", descripcion: "Insignia por representar iniciativas ecológicas", completado: false, idNFC: 1),
            
            Insignia(id: 26, idZona: 6, idEvento: -1, nombre: "Iniciativa Verde", imagen: "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png", descripcion: "Insignia por crear proyectos ecológicos comunitarios", completado: false, idNFC: 1),
            Insignia(id: 27, idZona: 6, idEvento: -1, nombre: "Voluntario Ambiental", imagen: "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png", descripcion: "Insignia por participar en actividades de limpieza", completado: false, idNFC: 1),
            Insignia(id: 28, idZona: 6, idEvento: -1, nombre: "Colaborador Verde", imagen: "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png", descripcion: "Insignia por colaborar en proyectos de conservación", completado: false, idNFC: 1),
            Insignia(id: 29, idZona: 6, idEvento: -1, nombre: "Embajador del Reciclaje", imagen: "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png", descripcion: "Insignia por fomentar el reciclaje en la comunidad", completado: false, idNFC: 1),
            Insignia(id: 30, idZona: 6, idEvento: -1, nombre: "Defensor de la Tierra", imagen: "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png", descripcion: "Insignia por proteger el medio ambiente", completado: false, idNFC: 1),
            Insignia(id: 31, idZona: 6, idEvento: -1, nombre: "Caminante del Planeta", imagen: "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png", descripcion: "Insignia por cuidar cada rincón del planeta", completado: false, idNFC: 1),
            Insignia(id: 32, idZona: 6, idEvento: -1, nombre: "Héroe de la Naturaleza", imagen: "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png", descripcion: "Insignia por acciones heroicas en pro de la naturaleza", completado: false, idNFC: 1),
            Insignia(id: 33, idZona: 0, idEvento: 1, nombre: "Iniciativa Verde", imagen: "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png", descripcion: "Insignia por crear proyectos ecológicos comunitarios", completado: false, idNFC: 1),
            Insignia(id: 34, idZona: 0, idEvento: 1, nombre: "Voluntario Ambiental", imagen: "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png", descripcion: "Insignia por participar en actividades de limpieza", completado: false, idNFC: 1),
            Insignia(id: 35, idZona: 0, idEvento: 1, nombre: "Colaborador Verde", imagen: "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png", descripcion: "Insignia por colaborar en proyectos de conservación", completado: false, idNFC: 1),
            Insignia(id: 36, idZona: 0, idEvento: 1, nombre: "Embajador del Reciclaje", imagen: "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png", descripcion: "Insignia por fomentar el reciclaje en la comunidad", completado: false, idNFC: 1),
            Insignia(id: 37, idZona: 0, idEvento: 1, nombre: "Defensor de la Tierra", imagen: "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png", descripcion: "Insignia por proteger el medio ambiente", completado: false, idNFC: 1),
            Insignia(id: 38, idZona: 0, idEvento: 1, nombre: "Caminante del Planeta", imagen: "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png", descripcion: "Insignia por cuidar cada rincón del planeta", completado: false, idNFC: 1),
            Insignia(id: 39, idZona: 0, idEvento: 1, nombre: "Héroe de la Naturaleza", imagen: "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png", descripcion: "Insignia por acciones heroicas en pro de la naturaleza", completado: false, idNFC: 1)
        ]
        
        /*
        let fotos = [
            // Zona 1
            Foto(id: 1, idZona: 1, idVisita: 1, imagen: nil, completado: false),
            Foto(id: 2, idZona: 1, idVisita: 1, imagen: nil, completado: false),
            Foto(id: 3, idZona: 1, idVisita: 1, imagen: nil, completado: false),

            // Zona 2
            Foto(id: 4, idZona: 2, idVisita: 1, imagen: nil, completado: false),
            Foto(id: 5, idZona: 2, idVisita: 1, imagen: nil, completado: false),
            Foto(id: 6, idZona: 2, idVisita: 1, imagen: nil, completado: false),

            // Zona 3
            Foto(id: 7, idZona: 3, idVisita: 1, imagen: nil, completado: false),
            Foto(id: 8, idZona: 3, idVisita: 1, imagen: nil, completado: false),
            Foto(id: 9, idZona: 3, idVisita: 1, imagen: nil, completado: false),

            // Zona 4
            Foto(id: 10, idZona: 4, idVisita: 1, imagen: nil, completado: false),
            Foto(id: 11, idZona: 4, idVisita: 1, imagen: nil, completado: false),
            Foto(id: 12, idZona: 4, idVisita: 1, imagen: nil, completado: false),

            // Zona 5
            Foto(id: 13, idZona: 5, idVisita: 1, imagen: nil, completado: false),
            Foto(id: 14, idZona: 5, idVisita: 1, imagen: nil, completado: false),
            Foto(id: 15, idZona: 5, idVisita: 1, imagen: nil, completado: false),

            // Zona 6
            Foto(id: 16, idZona: 6, idVisita: 1, imagen: nil, completado: false),
            Foto(id: 17, idZona: 6, idVisita: 1, imagen: nil, completado: false),
            Foto(id: 18, idZona: 6, idVisita: 1, imagen: nil, completado: false)
        ]*/
        
        var fotos: [Foto] = []

        let totalZonas = 6 // Total number of zonas
        let fotosPorZona = 3 // Number of photos per zona
        var fotoId = 1 // Initialize the fotoId counter

        // Populate fotos with 20 visits
        for idVisita in 1...20 {
            for idZona in 1...totalZonas {
                for _ in 0..<fotosPorZona {
                    let foto = Foto(id: fotoId, idZona: idZona, idVisita: idVisita, imagen: nil, completado: false)
                    fotos.append(foto)
                    fotoId += 1 // Increment the fotoId for the next photo
                }
            }
        }

        
        
        let exhibiciones = [
            // Zona 1
            Exhibicion(id: 1, idZona: 1, nombre: "Exploración Espacial", descripcion: "Un recorrido por la historia de la exploración espacial y sus logros.", completado: false, imagen: "https://i.ibb.co/RzQd3tm/Space-Exploration.jpg", isOpen: true, location: "Sala del Espacio"),
            Exhibicion(id: 2, idZona: 1, nombre: "Robótica Interactiva", descripcion: "Exposición interactiva con robots y tecnología avanzada.", completado: false, imagen: "https://i.ibb.co/YZb9rgw/Interactive-Robotics.jpg", isOpen: true, location: "Sala de Tecnología"),
            Exhibicion(id: 3, idZona: 1, nombre: "Aventuras Dinámicas", descripcion: "Una serie de desafíos interactivos para explorar conceptos de física y movimiento.", completado: false, imagen: "https://i.ibb.co/B3tzfj8/Dynamic-Adventures.jpg", isOpen: true, location: "Sala de Movimiento"),

            // Zona 2
            Exhibicion(id: 4, idZona: 2, nombre: "Ecosistemas de México", descripcion: "Explora los ecosistemas diversos de México y sus especies.", completado: false, imagen: "https://i.ibb.co/X5xM39T/Ecosystemsof-Mexico.jpg", isOpen: true, location: "Sala de Biodiversidad"),
            Exhibicion(id: 5, idZona: 2, nombre: "El Mundo del Agua", descripcion: "Una exhibición sobre el ciclo del agua y su importancia en el planeta.", completado: false, imagen: "https://i.ibb.co/WnCpT9r/The-Worldof-Water.jpg", isOpen: true, location: "Sala del Agua"),
            Exhibicion(id: 6, idZona: 2, nombre: "Misterios del Océano", descripcion: "Sumérgete en los secretos del océano y sus criaturas marinas.", completado: false, imagen: "https://i.ibb.co/YQwJtqp/Ocean-Mysteries.jpg", isOpen: true, location: "Sala del Océano"),

            // Zona 3
            Exhibicion(id: 7, idZona: 3, nombre: "Los Sentidos", descripcion: "Descubre cómo funcionan nuestros sentidos y explóralos a través de experimentos.", completado: false, imagen: "https://i.ibb.co/j6VVzf1/The-Senses.jpg", isOpen: true, location: "Sala de los Sentidos"),
            Exhibicion(id: 8, idZona: 3, nombre: "El Cuerpo Humano", descripcion: "Explora la anatomía humana con modelos y actividades interactivas.", completado: false, imagen: "https://i.ibb.co/m0tsDHH/The-Human-Body.jpg", isOpen: true, location: "Sala de Anatomía"),
            Exhibicion(id: 9, idZona: 3, nombre: "Cómo Funciona la Mente", descripcion: "Una exploración de la psicología y las emociones humanas.", completado: false, imagen: "https://i.ibb.co/bvhB3T1/Howthe-Mind-Works.jpg", isOpen: true, location: "Sala de la Mente"),

            // Zona 4
            Exhibicion(id: 10, idZona: 4, nombre: "Vida de los Dinosaurios", descripcion: "Un viaje en el tiempo para conocer cómo vivían los dinosaurios.", completado: false, imagen: "https://i.ibb.co/gJBVprP/Lifeof-Dinosaurs.jpg", isOpen: true, location: "Sala de Dinosaurios"),
            Exhibicion(id: 11, idZona: 4, nombre: "Fósiles y Minerales", descripcion: "Descubre el mundo de los fósiles y la formación de minerales.", completado: false, imagen: "https://i.ibb.co/ZVbjtS9/Fossilsand-Minerals.jpg", isOpen: true, location: "Sala de Geología"),
            Exhibicion(id: 12, idZona: 4, nombre: "Los Primeros Humanos", descripcion: "Explora los inicios de la humanidad y la evolución.", completado: false, imagen: "https://i.ibb.co/gy2bVzr/The-First-Humans.jpg", isOpen: true, location: "Sala de Antropología"),

            // Zona 5
            Exhibicion(id: 13, idZona: 5, nombre: "El Arte de la Luz", descripcion: "Exposición interactiva que explora cómo funciona la luz y sus efectos.", completado: false, imagen: "https://i.ibb.co/FBVjDps/The-Artof-Light.jpg", isOpen: true, location: "Sala de Luz"),
            Exhibicion(id: 14, idZona: 5, nombre: "El Mundo de la Electricidad", descripcion: "Actividades sobre el funcionamiento y la historia de la electricidad.", completado: false, imagen: "https://i.ibb.co/2WZ7SfH/The-Worldof-Electricity.jpg", isOpen: true, location: "Sala de Electricidad"),
            Exhibicion(id: 15, idZona: 5, nombre: "Matemáticas en Acción", descripcion: "Interactúa con conceptos matemáticos de manera divertida y práctica.", completado: false, imagen: "https://i.ibb.co/qYCLH34/Mathematicsin-Action.jpg", isOpen: true, location: "Sala de Matemáticas"),

            // Zona 6
            Exhibicion(id: 16, idZona: 6, nombre: "Comunicación a través del Tiempo", descripcion: "Explora cómo ha evolucionado la comunicación a lo largo de la historia.", completado: false, imagen: "https://i.ibb.co/KVY3xpp/Communicationthrough-Time.jpg", isOpen: true, location: "Sala de Comunicación"),
            Exhibicion(id: 17, idZona: 6, nombre: "Transporte y Movilidad", descripcion: "Descubre la evolución del transporte a través de los tiempos.", completado: false, imagen: "https://i.ibb.co/Q9N136c/Transportationand-Mobility.jpg", isOpen: true, location: "Sala de Transporte"),
            Exhibicion(id: 18, idZona: 6, nombre: "Energía Sostenible", descripcion: "Conoce los avances y beneficios de las energías renovables.", completado: false, imagen: "https://i.ibb.co/T4WChBm/Sustainable-Energy.jpg", isOpen: true, location: "Sala de Energía Renovable")
        ];



        
        
        // Add Zonas
        for zona in zonas {
            context.insert(zona)
        }
        
        // Add Eventos
        for evento in eventos {
            context.insert(evento)
        }
        
        // Add Visitas
        /*for visita in visitas {
            context.insert(visita)
        }*/
        
        // Add InsigniasObtenidas
        /*
        for insigniaObtenida in insigniasObtenidas {
            context.insert(insigniaObtenida)
        }*/
        
        // Add Insignias
        for insignia in insignias {
            context.insert(insignia)
        }
        
        // Add Fotos
        for foto in fotos {
            if !existingFotoIDs.contains(foto.id){
                context.insert(foto)
            }
        }

        // Add Exhibicion
        for exhibicion in exhibiciones {
            context.insert(exhibicion)
        }
        
        // Add Pin
        for pin in pines {
            context.insert(pin)
        }
    
   }

}

