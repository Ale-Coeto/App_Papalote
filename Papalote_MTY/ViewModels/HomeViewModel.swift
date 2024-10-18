//
//  HomeViewModel.swift
//  Papalote_MTY
//
//  Created by Alejandra Coeto on 14/10/24.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var zonas = [Zona(id: 1, nombre: "Pertenezco", descripcion: "aaaa", color: "#C4D600", logo: "LogoPertenezco"), Zona(id: 2, nombre: "Comunico", descripcion: "annn", color: "#006BA6", logo: "LogoComunico"), Zona(id: 3, nombre: "Comprendo", descripcion: "aerkljvrnea", color: "#84329B", logo: "LogoComprendo"), Zona(id: 4, nombre: "Soy", descripcion: "aei;rj;oei", color: "#D50032", logo: "LogoSoy"), Zona(id: 5, nombre: "Expreso", descripcion: "ahvi", color: "#FF8200", logo: "LogoExpreso"), Zona(id: 6, nombre: "Pequeños", descripcion: "aeoirh", color: "#009CA6", logo: "LogoPequenos")]
    
    @Published var eventoEspecial = Evento(id: 1, fechaInicio: Date(), fechaFin: Date(), nombre: "Semana Mundial del espacio", descripcion: "dia del espacio", imagen: "a")
}
