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
        

        // Fetch and delete all existing Fotos objects
        /*let existingFotos = try? context.fetch(FetchDescriptor<Foto>())
        existingFotos?.forEach { context.delete($0) }*/
        
        // Fetch and delete all existing Exhibicion objects
        let existingExhibicion = try? context.fetch(FetchDescriptor<Exhibicion>())
        existingExhibicion?.forEach { context.delete($0) }
        
        // Fetch and delete all existing InsigniaObtenida objects
       /* let existingInsigniasObtenidas = try? context.fetch(FetchDescriptor<InsigniaObtenida>())
        existingInsigniasObtenidas?.forEach { context.delete($0) }*/
    
        // Define the data to add
        let zonas = [
            Zona(id: 1, nombre: "Pertenezco", descripcion: "Zona que te invita a comunicar tus ideas para mejorar el medio ambiente. ", color: "#C4D600", logo: "LogoPertenezco"),
            Zona(id: 2, nombre: "Comunico", descripcion: "Poco a poco te darás cuenta de que pertenecemos a una gran red de vida en la que todo se relaciona para funcionar. ", color: "#006BA6", logo: "LogoComunico"),
            Zona(id: 3, nombre: "Comprendo", descripcion: "Aquí en la zona científica entenderás cómo funciona nuestro planeta y cómo podemos cuidarlo a través de la ciencia. ", color: "#84329B", logo: "LogoComprendo"),
            Zona(id: 4, nombre: "Soy", descripcion: "Aquí, te darás cuenta de que las decisiones que tomes día a día, pueden dañar o mejorar al medio ambiente.", color: "#D50032" , logo: "LogoSoy"),
            Zona(id: 5, nombre: "Expreso", descripcion: "Es una oportunidad para poder expresar todos los sentimientos y emociones que te produce la naturaleza, y qué mejor manera que a través del arte.", color: "#FF8200", logo: "LogoExpreso"),
            Zona(id: 6, nombre: "Pequeños", descripcion: "Zona reservada para los niños menores de 5 años. Los pequeños jugarán en un ambiente inspirado en la naturaleza, ya sea en el bosque o en el mar. ", color: "#009CA6", logo: "LogoPequeños")
        ]
        
        let eventos = [
            Evento(id: 1, fechaInicio: Date(), fechaFin: Date(), nombre: "Semana Cosmica", descripcion: "dia del espacio", imagen: "a")
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
        ]

        
        
        let exhibiciones = [
            // Zona 1
            Exhibicion(id: 1, idZona: 1, nombre: "Exhibición de Arte Moderno", descripcion: "Una colección de obras de arte moderno de varios artistas.", completado: false, imagen: "https://w7.pngwing.com/pngs/963/1005/png-transparent-modern-art-drawing-visual-arts-design-child-text-cartoon.png", isOpen: true, location: "Sala de Arte"),
            Exhibicion(id: 2, idZona: 1, nombre: "Exhibición de Arte Moderno", descripcion: "Una colección de obras de arte moderno de varios artistas.", completado: false, imagen: "https://w7.pngwing.com/pngs/963/1005/png-transparent-modern-art-drawing-visual-arts-design-child-text-cartoon.png", isOpen: true, location: "Sala de Arte"),
            Exhibicion(id: 3, idZona: 1, nombre: "Exhibición de Arte Moderno", descripcion: "Una colección de obras de arte moderno de varios artistas.", completado: false, imagen: "https://w7.pngwing.com/pngs/963/1005/png-transparent-modern-art-drawing-visual-arts-design-child-text-cartoon.png", isOpen: true, location: "Sala de Arte"),

            // Zona 2
            Exhibicion(id: 4, idZona: 2, nombre: "Exhibición de Historia Natural", descripcion: "Explora la historia natural del planeta a través de diversas exposiciones.", completado: false, imagen: "https://www.biodiversidad.gob.mx/media/1/biodiversidad/curiosos/1Martin-de-la-Cruz.png", isOpen: true, location: "Sala de Ciencias"),
            Exhibicion(id: 5, idZona: 2, nombre: "Exhibición de Historia Natural", descripcion: "Explora la historia natural del planeta a través de diversas exposiciones.", completado: false, imagen: "https://www.biodiversidad.gob.mx/media/1/biodiversidad/curiosos/1Martin-de-la-Cruz.png", isOpen: true, location: "Sala de Ciencias"),
            Exhibicion(id: 6, idZona: 2, nombre: "Exhibición de Historia Natural", descripcion: "Explora la historia natural del planeta a través de diversas exposiciones.", completado: false, imagen: "https://www.biodiversidad.gob.mx/media/1/biodiversidad/curiosos/1Martin-de-la-Cruz.png", isOpen: true, location: "Sala de Ciencias"),

            // Zona 3
            Exhibicion(id: 7, idZona: 3, nombre: "Exhibición de Fotografía", descripcion: "Una exhibición de fotografía contemporánea de diversos fotógrafos.", completado: false, imagen: "https://static.vecteezy.com/system/resources/previews/013/266/682/non_2x/art-gallery-on-museum-of-exhibition-visitors-viewing-modern-abstract-paintings-at-contemporary-and-photo-in-flat-cartoon-hand-template-illustration-vector.jpg", isOpen: true, location: "Sala de Fotografía"),
            Exhibicion(id: 8, idZona: 3, nombre: "Exhibición de Fotografía", descripcion: "Una exhibición de fotografía contemporánea de diversos fotógrafos.", completado: false, imagen: "https://static.vecteezy.com/system/resources/previews/013/266/682/non_2x/art-gallery-on-museum-of-exhibition-visitors-viewing-modern-abstract-paintings-at-contemporary-and-photo-in-flat-cartoon-hand-template-illustration-vector.jpg", isOpen: true, location: "Sala de Fotografía"),
            Exhibicion(id: 9, idZona: 3, nombre: "Exhibición de Fotografía", descripcion: "Una exhibición de fotografía contemporánea de diversos fotógrafos.", completado: false, imagen: "https://static.vecteezy.com/system/resources/previews/013/266/682/non_2x/art-gallery-on-museum-of-exhibition-visitors-viewing-modern-abstract-paintings-at-contemporary-and-photo-in-flat-cartoon-hand-template-illustration-vector.jpg", isOpen: true, location: "Sala de Fotografía"),

            // Zona 4
            Exhibicion(id: 10, idZona: 4, nombre: "Exhibición de Esculturas", descripcion: "Una exhibición de esculturas de diversos escultores.", completado: false, imagen: "https://www.shutterstock.com/image-vector/art-gallery-museum-interior-cartoon-260nw-2180685197.jpg", isOpen: true, location: "Sala de Escultura"),
            Exhibicion(id: 11, idZona: 4, nombre: "Exhibición de Esculturas", descripcion: "Una exhibición de esculturas de diversos escultores.", completado: false, imagen: "https://www.shutterstock.com/image-vector/art-gallery-museum-interior-cartoon-260nw-2180685197.jpg", isOpen: true, location: "Sala de Escultura"),
            Exhibicion(id: 12, idZona: 4, nombre: "Exhibición de Esculturas", descripcion: "Una exhibición de esculturas de diversos escultores.", completado: false, imagen: "https://www.shutterstock.com/image-vector/art-gallery-museum-interior-cartoon-260nw-2180685197.jpg", isOpen: true, location: "Sala de Escultura"),

            // Zona 5
            Exhibicion(id: 13, idZona: 5, nombre: "Exhibición de Seda", descripcion: "Una exhibición de seda de diversos artistas.", completado: false, imagen: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-gPkkIiIzpqPdj8jAOgBswo79bLiPASxQNA&s", isOpen: true, location: "Sala de Seda"),
            Exhibicion(id: 14, idZona: 5, nombre: "Exhibición de Seda", descripcion: "Una exhibición de seda de diversos artistas.", completado: false, imagen: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-gPkkIiIzpqPdj8jAOgBswo79bLiPASxQNA&s", isOpen: true, location: "Sala de Seda"),
            Exhibicion(id: 15, idZona: 5, nombre: "Exhibición de Seda", descripcion: "Una exhibición de seda de diversos artistas.", completado: false, imagen: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-gPkkIiIzpqPdj8jAOgBswo79bLiPASxQNA&s", isOpen: true, location: "Sala de Seda"),

            // Zona 6
            Exhibicion(id: 16, idZona: 6, nombre: "Exhibición de Antropología", descripcion: "Una exhibición de antropología de diversos antropologos.", completado: false, imagen: "https://sic.gob.mx/imagenes_cache/museo_807_g_74070.png", isOpen: true, location: "Sala de Antropología"),
            Exhibicion(id: 17, idZona: 6, nombre: "Exhibición de Antropología", descripcion: "Una exhibición de antropología de diversos antropologos.", completado: false, imagen: "https://sic.gob.mx/imagenes_cache/museo_807_g_74070.png", isOpen: true, location: "Sala de Antropología"),
            Exhibicion(id: 18, idZona: 6, nombre: "Exhibición de Antropología", descripcion: "Una exhibición de antropología de diversos antropologos.", completado: false, imagen: "https://sic.gob.mx/imagenes_cache/museo_807_g_74070.png", isOpen: true, location: "Sala de Antropología")
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
            context.insert(foto)
        }

        // Add Exhibicion
        for exhibicion in exhibiciones {
            context.insert(exhibicion)
        }
    
   }

}

