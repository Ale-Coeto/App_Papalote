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
        let existingFotos = try? context.fetch(FetchDescriptor<Foto>())
        existingFotos?.forEach { context.delete($0) }
        
        // Fetch and delete all existing Exhibicion objects
        let existingExhibicion = try? context.fetch(FetchDescriptor<Exhibicion>())
        existingExhibicion?.forEach { context.delete($0) }
        
        // Fetch and delete all existing InsigniaObtenida objects
        let existingInsigniasObtenidas = try? context.fetch(FetchDescriptor<InsigniaObtenida>())
        existingInsigniasObtenidas?.forEach { context.delete($0) }
    
        // Define the data to add
        let zonas = [
            Zona(id: 1, nombre: "Pertenezco", descripcion: "aaaa", color: "#C4D600", logo: "LogoPertenezco"),
            Zona(id: 2, nombre: "Comunico", descripcion: "annn", color: "#006BA6", logo: "LogoComunico"),
            Zona(id: 3, nombre: "Comprendo", descripcion: "aerkljvrnea", color: "#84329B", logo: "LogoComprendo"),
            Zona(id: 4, nombre: "Soy", descripcion: "aei;rj;oei", color: "#D50032" , logo: "LogoSoy"),
            Zona(id: 5, nombre: "Expreso", descripcion: "ahvi", color: "#FF8200", logo: "LogoExpreso"),
            Zona(id: 6, nombre: "Pequeños", descripcion: "aeoirh", color: "#009CA6", logo: "LogoPequenos")
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

            Insignia(id: 1, idZona: 1, idEvento: -1, nombre: "Eco Guerrero", imagen: "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png", descripcion: "Insignia por promover acciones ecológicas", idNFC: 1),
            Insignia(id: 2, idZona: 1, idEvento: -1, nombre: "Protector del Bosque", imagen: "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png", descripcion: "Insignia por proteger los recursos naturales", idNFC: 1),
            Insignia(id: 3, idZona: 1, idEvento: -1, nombre: "Amigo de la Tierra", imagen: "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png", descripcion: "Insignia por cuidar la biodiversidad", idNFC: 1),
            Insignia(id: 4, idZona: 1, idEvento: -1, nombre: "Héroe Sustentable", imagen: "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png", descripcion: "Insignia por promover la sustentabilidad", idNFC: 1),
            Insignia(id: 5, idZona: 1, idEvento: -1, nombre: "Defensor del Clima", imagen: "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png", descripcion: "Insignia por reducir la huella de carbono", idNFC: 1),
            Insignia(id: 6, idZona: 1, idEvento: -1, nombre: "Guardián del Futuro", imagen: "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png", descripcion: "Insignia por cuidar el planeta para futuras generaciones", idNFC: 1),
            
            Insignia(id: 7, idZona: 2, idEvento: -1, nombre: "Explorador del Aire", imagen: "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png", descripcion: "Insignia por realizar actividades al aire libre", idNFC: 1),
            Insignia(id: 8, idZona: 2, idEvento: -1, nombre: "Viajero Sostenible", imagen: "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png", descripcion: "Insignia por reducir el impacto ambiental durante viajes", idNFC: 1),
            Insignia(id: 9, idZona: 2, idEvento: -1, nombre: "Guía de la Naturaleza", imagen: "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png", descripcion: "Insignia por enseñar a otros sobre la preservación", idNFC: 1),
            Insignia(id: 10, idZona: 2, idEvento: -1, nombre: "Aventurero Verde", imagen: "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png", descripcion: "Insignia por explorar sin dañar el entorno natural", idNFC: 1),
            Insignia(id: 11, idZona: 2, idEvento: -1, nombre: "Vigilante del Cielo", imagen: "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png", descripcion: "Insignia por monitorear la calidad del aire", idNFC: 1),
            
            Insignia(id: 12, idZona: 3, idEvento: -1, nombre: "Constructor Ecológico", imagen: "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png", descripcion: "Insignia por construir usando materiales sostenibles", idNFC: 1),
            Insignia(id: 13, idZona: 3, idEvento: -1, nombre: "Arquitecto Verde", imagen: "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png", descripcion: "Insignia por diseñar proyectos eco-amigables", idNFC: 1),
            Insignia(id: 14, idZona: 3, idEvento: -1, nombre: "Innovador Sustentable", imagen: "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png", descripcion: "Insignia por crear soluciones ecológicas innovadoras", idNFC: 1),
            
            Insignia(id: 15, idZona: 4, idEvento: -1, nombre: "Guardián de los Mares", imagen: "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png", descripcion: "Insignia por proteger los ecosistemas marinos", idNFC: 1),
            Insignia(id: 16, idZona: 4, idEvento: -1, nombre: "Navegante Sostenible", imagen: "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png", descripcion: "Insignia por viajar responsablemente por el océano", idNFC: 1),
            Insignia(id: 17, idZona: 4, idEvento: -1, nombre: "Aliado del Océano", imagen: "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png", descripcion: "Insignia por limpiar playas y costas", idNFC: 1),
            Insignia(id: 18, idZona: 4, idEvento: -1, nombre: "Defensor de los Arrecifes", imagen: "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png", descripcion: "Insignia por proteger los arrecifes de coral", idNFC: 1),
            Insignia(id: 19, idZona: 4, idEvento: -1, nombre: "Guardacostas Verde", imagen: "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png", descripcion: "Insignia por preservar la fauna marina", idNFC: 1),
            Insignia(id: 20, idZona: 4, idEvento: -1, nombre: "Marinero Ecológico", imagen: "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png", descripcion: "Insignia por promover el transporte marino limpio", idNFC: 1),
            Insignia(id: 21, idZona: 4, idEvento: -1, nombre: "Protector de las Aguas", imagen: "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png", descripcion: "Insignia por monitorear la salud de los océanos", idNFC: 1),
            
            Insignia(id: 22, idZona: 5, idEvento: -1, nombre: "Cosechador Orgánico", imagen: "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png", descripcion: "Insignia por promover la agricultura orgánica", idNFC: 1),
            Insignia(id: 23, idZona: 5, idEvento: -1, nombre: "Granjero Ecológico", imagen: "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png", descripcion: "Insignia por cuidar el suelo y los cultivos sostenibles", idNFC: 1),
            Insignia(id: 24, idZona: 5, idEvento: -1, nombre: "Defensor del Agro", imagen: "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png", descripcion: "Insignia por proteger la biodiversidad en la agricultura", idNFC: 1),
            Insignia(id: 25, idZona: 5, idEvento: -1, nombre: "Sembrador Verde", imagen: "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png", descripcion: "Insignia por prácticas de siembra responsables", idNFC: 1),
            Insignia(id: 26, idZona: 5, idEvento: -1, nombre: "Recolector Responsable", imagen: "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png", descripcion: "Insignia por recolectar de manera sustentable", idNFC: 1),
            
            Insignia(id: 27, idZona: 6, idEvento: -1, nombre: "Cuidador del Ecosistema", imagen: "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png", descripcion: "Insignia por preservar el equilibrio ecológico", idNFC: 1),
            Insignia(id: 28, idZona: 6, idEvento: -1, nombre: "Guardabosques Responsable", imagen: "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png", descripcion: "Insignia por proteger los bosques y selvas", idNFC: 1),
            Insignia(id: 29, idZona: 6, idEvento: -1, nombre: "Líder Ambiental", imagen: "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png", descripcion: "Insignia por liderar proyectos de conservación ambiental", idNFC: 1),
            
            Insignia(id: 30, idZona: -1, idEvento: -1, nombre: "Embajador Sostenible", imagen: "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png", descripcion: "Insignia por representar la causa ecológica a nivel global", idNFC: 1),
            Insignia(id: 31, idZona: -1, idEvento: -1, nombre: "Innovador Verde", imagen: "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png", descripcion: "Insignia por desarrollar soluciones tecnológicas verdes", idNFC: 1),
            Insignia(id: 32, idZona: -1, idEvento: -1, nombre: "Conservacionista del Futuro", imagen: "https://png.pngtree.com/png-clipart/20220823/original/pngtree-green-eco-friendly-badge-design-png-image_8476472.png", descripcion: "Insignia por esfuerzos en la conservación de la naturaleza", idNFC: 1)
        ]
        
        
        let fotos = [
            // Zona 1
            Foto(id: 1, idZona: 1, idVisita: 1, imagen: "https://i.pinimg.com/474x/e0/af/b1/e0afb1f32c8af2af99cdfbb227edc885.jpg"),
            Foto(id: 2, idZona: 1, idVisita: 1, imagen: "https://i.pinimg.com/474x/e0/af/b1/e0afb1f32c8af2af99cdfbb227edc885.jpg"),
            Foto(id: 3, idZona: 1, idVisita: 1, imagen: "https://i.pinimg.com/474x/e0/af/b1/e0afb1f32c8af2af99cdfbb227edc885.jpg"),

            // Zona 2
            Foto(id: 4, idZona: 2, idVisita: 1, imagen: "https://i.pinimg.com/236x/90/a9/b9/90a9b9f5e07f6e1b890f7f433ded38bb.jpg"),
            Foto(id: 5, idZona: 2, idVisita: 1, imagen: "https://i.pinimg.com/236x/90/a9/b9/90a9b9f5e07f6e1b890f7f433ded38bb.jpg"),
            Foto(id: 6, idZona: 2, idVisita: 1, imagen: "https://i.pinimg.com/236x/90/a9/b9/90a9b9f5e07f6e1b890f7f433ded38bb.jpg"),

            // Zona 3
            Foto(id: 7, idZona: 3, idVisita: 1, imagen: "https://i.pinimg.com/474x/6a/08/7b/6a087ba1d220918fccdcb2f7c29c9814.jpg"),
            Foto(id: 8, idZona: 3, idVisita: 1, imagen: "https://i.pinimg.com/474x/6a/08/7b/6a087ba1d220918fccdcb2f7c29c9814.jpg"),
            Foto(id: 9, idZona: 3, idVisita: 1, imagen: "https://i.pinimg.com/474x/6a/08/7b/6a087ba1d220918fccdcb2f7c29c9814.jpg"),

            // Zona 4
            Foto(id: 10, idZona: 4, idVisita: 1, imagen: "https://i.pinimg.com/474x/14/3c/19/143c19d4bb713cc56671199245259b79.jpg"),
            Foto(id: 11, idZona: 4, idVisita: 1, imagen: "https://i.pinimg.com/474x/14/3c/19/143c19d4bb713cc56671199245259b79.jpg"),
            Foto(id: 12, idZona: 4, idVisita: 1, imagen: "https://i.pinimg.com/474x/14/3c/19/143c19d4bb713cc56671199245259b79.jpg"),

            // Zona 5
            Foto(id: 13, idZona: 5, idVisita: 1, imagen: "https://i.pinimg.com/550x/bd/a9/44/bda944b838ecbf867917c445a69347d7.jpg"),
            Foto(id: 14, idZona: 5, idVisita: 1, imagen: "https://i.pinimg.com/550x/bd/a9/44/bda944b838ecbf867917c445a69347d7.jpg"),
            Foto(id: 15, idZona: 5, idVisita: 1, imagen: "https://i.pinimg.com/550x/bd/a9/44/bda944b838ecbf867917c445a69347d7.jpg"),

            // Zona 6
            Foto(id: 16, idZona: 6, idVisita: 1, imagen: "https://i.pinimg.com/236x/6e/49/1b/6e491b12a21ca77d2ac85b5dd83fb827.jpg"),
            Foto(id: 17, idZona: 6, idVisita: 1, imagen: "https://i.pinimg.com/236x/6e/49/1b/6e491b12a21ca77d2ac85b5dd83fb827.jpg"),
            Foto(id: 18, idZona: 6, idVisita: 1, imagen: "https://i.pinimg.com/236x/6e/49/1b/6e491b12a21ca77d2ac85b5dd83fb827.jpg")
        ]
        
        
        let exhibiciones = [
            // Zona 1
            Exhibicion(id: 1, idZona: 1, nombre: "Exhibición de Arte Moderno", descripcion: "Una colección de obras de arte moderno de varios artistas.", imagen: "https://w7.pngwing.com/pngs/963/1005/png-transparent-modern-art-drawing-visual-arts-design-child-text-cartoon.png", isOpen: true, location: "Sala de Arte"),
            Exhibicion(id: 2, idZona: 1, nombre: "Exhibición de Arte Moderno", descripcion: "Una colección de obras de arte moderno de varios artistas.", imagen: "https://w7.pngwing.com/pngs/963/1005/png-transparent-modern-art-drawing-visual-arts-design-child-text-cartoon.png", isOpen: true, location: "Sala de Arte"),
            Exhibicion(id: 3, idZona: 1, nombre: "Exhibición de Arte Moderno", descripcion: "Una colección de obras de arte moderno de varios artistas.", imagen: "https://w7.pngwing.com/pngs/963/1005/png-transparent-modern-art-drawing-visual-arts-design-child-text-cartoon.png", isOpen: true, location: "Sala de Arte"),

            // Zona 2
            Exhibicion(id: 4, idZona: 2, nombre: "Exhibición de Historia Natural", descripcion: "Explora la historia natural del planeta a través de diversas exposiciones.", imagen: "https://www.biodiversidad.gob.mx/media/1/biodiversidad/curiosos/1Martin-de-la-Cruz.png", isOpen: true, location: "Sala de Ciencias"),
            Exhibicion(id: 5, idZona: 2, nombre: "Exhibición de Historia Natural", descripcion: "Explora la historia natural del planeta a través de diversas exposiciones.", imagen: "https://www.biodiversidad.gob.mx/media/1/biodiversidad/curiosos/1Martin-de-la-Cruz.png", isOpen: true, location: "Sala de Ciencias"),
            Exhibicion(id: 6, idZona: 2, nombre: "Exhibición de Historia Natural", descripcion: "Explora la historia natural del planeta a través de diversas exposiciones.", imagen: "https://www.biodiversidad.gob.mx/media/1/biodiversidad/curiosos/1Martin-de-la-Cruz.png", isOpen: true, location: "Sala de Ciencias"),

            // Zona 3
            Exhibicion(id: 7, idZona: 3, nombre: "Exhibición de Fotografía", descripcion: "Una exhibición de fotografía contemporánea de diversos fotógrafos.", imagen: "https://static.vecteezy.com/system/resources/previews/013/266/682/non_2x/art-gallery-on-museum-of-exhibition-visitors-viewing-modern-abstract-paintings-at-contemporary-and-photo-in-flat-cartoon-hand-template-illustration-vector.jpg", isOpen: true, location: "Sala de Fotografía"),
            Exhibicion(id: 8, idZona: 3, nombre: "Exhibición de Fotografía", descripcion: "Una exhibición de fotografía contemporánea de diversos fotógrafos.", imagen: "https://static.vecteezy.com/system/resources/previews/013/266/682/non_2x/art-gallery-on-museum-of-exhibition-visitors-viewing-modern-abstract-paintings-at-contemporary-and-photo-in-flat-cartoon-hand-template-illustration-vector.jpg", isOpen: true, location: "Sala de Fotografía"),
            Exhibicion(id: 9, idZona: 3, nombre: "Exhibición de Fotografía", descripcion: "Una exhibición de fotografía contemporánea de diversos fotógrafos.", imagen: "https://static.vecteezy.com/system/resources/previews/013/266/682/non_2x/art-gallery-on-museum-of-exhibition-visitors-viewing-modern-abstract-paintings-at-contemporary-and-photo-in-flat-cartoon-hand-template-illustration-vector.jpg", isOpen: true, location: "Sala de Fotografía"),

            // Zona 4
            Exhibicion(id: 10, idZona: 4, nombre: "Exhibición de Esculturas", descripcion: "Una exhibición de esculturas de diversos escultores.", imagen: "https://www.shutterstock.com/image-vector/art-gallery-museum-interior-cartoon-260nw-2180685197.jpg", isOpen: true, location: "Sala de Escultura"),
            Exhibicion(id: 11, idZona: 4, nombre: "Exhibición de Esculturas", descripcion: "Una exhibición de esculturas de diversos escultores.", imagen: "https://www.shutterstock.com/image-vector/art-gallery-museum-interior-cartoon-260nw-2180685197.jpg", isOpen: true, location: "Sala de Escultura"),
            Exhibicion(id: 12, idZona: 4, nombre: "Exhibición de Esculturas", descripcion: "Una exhibición de esculturas de diversos escultores.", imagen: "https://www.shutterstock.com/image-vector/art-gallery-museum-interior-cartoon-260nw-2180685197.jpg", isOpen: true, location: "Sala de Escultura"),

            // Zona 5
            Exhibicion(id: 13, idZona: 5, nombre: "Exhibición de Seda", descripcion: "Una exhibición de seda de diversos artistas.", imagen: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-gPkkIiIzpqPdj8jAOgBswo79bLiPASxQNA&s", isOpen: true, location: "Sala de Seda"),
            Exhibicion(id: 14, idZona: 5, nombre: "Exhibición de Seda", descripcion: "Una exhibición de seda de diversos artistas.", imagen: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-gPkkIiIzpqPdj8jAOgBswo79bLiPASxQNA&s", isOpen: true, location: "Sala de Seda"),
            Exhibicion(id: 15, idZona: 5, nombre: "Exhibición de Seda", descripcion: "Una exhibición de seda de diversos artistas.", imagen: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-gPkkIiIzpqPdj8jAOgBswo79bLiPASxQNA&s", isOpen: true, location: "Sala de Seda"),

            // Zona 6
            Exhibicion(id: 16, idZona: 6, nombre: "Exhibición de Antropología", descripcion: "Una exhibición de antropología de diversos antropologos.", imagen: "https://sic.gob.mx/imagenes_cache/museo_807_g_74070.png", isOpen: true, location: "Sala de Antropología"),
            Exhibicion(id: 17, idZona: 6, nombre: "Exhibición de Antropología", descripcion: "Una exhibición de antropología de diversos antropologos.", imagen: "https://sic.gob.mx/imagenes_cache/museo_807_g_74070.png", isOpen: true, location: "Sala de Antropología"),
            Exhibicion(id: 18, idZona: 6, nombre: "Exhibición de Antropología", descripcion: "Una exhibición de antropología de diversos antropologos.", imagen: "https://sic.gob.mx/imagenes_cache/museo_807_g_74070.png", isOpen: true, location: "Sala de Antropología")
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

