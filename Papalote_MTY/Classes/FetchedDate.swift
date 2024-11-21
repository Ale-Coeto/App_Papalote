
//
//  LastUpdate.swift
//  Papalote_MTY
//
//  Created by alumno on 19/11/24.
//


import Foundation
import SwiftData

// Class used to store the last sync originated from the device

@Model
class FetchedDate {
    var date: Date
    
    init(date: Date) {
        self.date = date
    }
}
