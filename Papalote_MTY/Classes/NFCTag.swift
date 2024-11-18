//
//  NFCTag.swift
//  Papalote_MTY
//
//  Created by José Guerrero  on 18/11/24.
//

import Foundation
import SwiftData

class NFCTag: Identifiable, Codable {
    var id: Int
    var tagName: String
    var date: Date?
    var scanned: Bool
    
    init(id: Int, tagName: String, date: Date?, scanned: Bool) {
        self.id = id
        self.tagName = tagName
        self.date = date
        self.scanned = scanned
    }
}
