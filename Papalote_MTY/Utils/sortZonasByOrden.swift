import SwiftData

// Function to sort zonas based on the orden property of Visita
func sortZonasByOrden(zonas: [Zona], orden: String) -> [Zona] {
    let ordenArray = orden.components(separatedBy: " ")

    // Create a dictionary to store the index of each zona based on orden
    var zonaOrderDict: [String: Int] = [:] // Use String for zona.nombre

    // Populate the dictionary with the order from ordenArray
    for (index, word) in ordenArray.enumerated() {
        zonaOrderDict[word] = index // Map the zona nombre to its index in orden
    }
    
    // Sort zonas based on the order dictionary
    let sortedZonas = zonas.sorted { zona1, zona2 in
        let order1 = zonaOrderDict[zona1.nombre] ?? Int.max // Default to max if not found
        let order2 = zonaOrderDict[zona2.nombre] ?? Int.max // Default to max if not found
        return order1 < order2
    }
    
    return sortedZonas
}
