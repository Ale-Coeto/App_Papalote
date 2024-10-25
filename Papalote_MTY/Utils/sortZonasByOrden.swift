import SwiftData

// Function to sort zonas based on the orden property of Visita
func sortZonasByOrden(zonas: [Zona], orden: String) -> [Zona] {
    let ordenArray = orden.components(separatedBy: " ")
    // Create a dictionary to store the index of each zona based on orden
    var zonaOrderDict: [Int: Int] = [:]

    // Assuming each Zona has a unique nombre that matches the words in orden
    for (index, word) in ordenArray.enumerated() {
        if let zona = zonas.first(where: { $0.nombre == word }) {
            zonaOrderDict[zona.id] = index // Map the zona id to its index in orden
        }
    }
    
    // Sort zonas based on the order dictionary
    return zonas.sorted {
        guard let order1 = zonaOrderDict[$0.id], let order2 = zonaOrderDict[$1.id] else {
            return false
        }
        return order1 < order2
    }
}
