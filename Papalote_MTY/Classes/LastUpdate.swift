//
//  LastUpdate.swift
//  Papalote_MTY
//
//  Created by alumno on 19/11/24.
//


import Foundation
import SwiftData

// Class used to fetch last update from webpage. We have 2 classes to avoid implementing encoding and decoding methods

class LastUpdate : Codable {
    var date: Date
    
    init(date: Date) {
        self.date = date
    }
}
