//
//  NFCTagsList.swift
//  Papalote_MTY
//
//  Created by José Guerrero  on 20/11/24.
//

import Foundation

class NFCTagsList: ObservableObject {
    @Published var tags = [NFCTag]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(tags) {
                try? encoded.write(to: fileURL())
            }
        }
    }
    
    init() {
        if let retrievedData = try? Data(contentsOf: fileURL()) {
            if let decodedData = try? JSONDecoder().decode([NFCTag].self, from: retrievedData) {
                tags = decodedData
                return
            }
        }
        tags = []
    }
    
    func fileURL() -> URL {
        let url = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
        let filePath = url.appendingPathComponent("NFCTags.json")
        print(filePath.path)
        return filePath
    }
    
    func addTag(_ tag: NFCTag) {
        tags.append(tag)
    }
    
    private func printTagsList() {
        print("Current NFCTags List:")
            for tag in tags {
                print("ID: \(tag.id), Tag Name: \(tag.tagName), Date: \(String(describing: tag.date)), Scanned: \(tag.scanned)")
            }
        }
}
