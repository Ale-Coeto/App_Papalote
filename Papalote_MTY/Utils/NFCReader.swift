//
//  NFCReader.swift
//  Papalote_MTY
//
//  Created by José Guerrero  on 11/11/24.
//

import CoreNFC
import Combine

class NFCReader: NSObject, ObservableObject, NFCNDEFReaderSessionDelegate {
    var session: NFCNDEFReaderSession?
    var onTagRead: ((NFCTag) -> Void)?

    func startReading(onTagRead: @escaping (NFCTag) -> Void) {
        self.onTagRead = onTagRead
        session = NFCNDEFReaderSession(delegate: self, queue: nil, invalidateAfterFirstRead: true)
        session?.begin()
    }

    func readerSession(_ session: NFCNDEFReaderSession, didInvalidateWithError error: Error) {
        print("Session invalidated: \(error.localizedDescription)")
    }

    func readerSession(_ session: NFCNDEFReaderSession, didDetectNDEFs messages: [NFCNDEFMessage]) {
        guard let message = messages.first else { return }
        for record in message.records {
            if let jsonString = String(data: record.payload, encoding: .utf8) {
                print("JSON String: \(jsonString)") // Print the JSON string
                if let tag = parseJSON(jsonString: jsonString) {
                    DispatchQueue.main.async {
                        self.onTagRead?(tag)
                    }
                }
            }
        }
    }

    private func parseJSON(jsonString: String) -> NFCTag? {
        let data = jsonString.data(using: .utf8)!
        do {
            let decoder = JSONDecoder()
            let tag = try decoder.decode(NFCTag.self, from: data)
            return tag
        } catch {
            print("Failed to decode JSON: \(error.localizedDescription)")
            return nil
        }
    }
}
