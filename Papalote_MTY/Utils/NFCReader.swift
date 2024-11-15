//
//  NFCReader.swift
//  Papalote_MTY
//
//  Created by José Guerrero  on 11/11/24.
//

import CoreNFC
import Combine

class NFCReader: NSObject, ObservableObject, NFCTagReaderSessionDelegate {
    @Published var tagData: String?
    private var readerSession: NFCTagReaderSession?
    var onTagRead: ((String) -> Void)?
    
    func startReading(completion: @escaping (String) -> Void) {
        self.onTagRead = completion
        guard NFCTagReaderSession.readingAvailable else {
            print("NFC is not available on this device")
            return
        }
        
        readerSession = NFCTagReaderSession(pollingOption: [.iso14443], delegate: self)
        readerSession?.begin()
    }

    func tagReaderSession(_ session: NFCTagReaderSession, didDetect tags: [NFCTag]) {
        if let tag = tags.first {
            session.connect(to: tag) { (error) in
                if let error = error {
                    print("Error connecting to tag: \(error)")
                    session.invalidate(errorMessage: "Connection failed")
                } else {
                    switch tag {
                    case .iso7816(let tag):
                        self.readNDEF(tag: tag as! NFCISO7816Tag, session: session)
                    case .iso15693(let tag):
                        self.readNDEF(tag: tag as! NFCISO15693Tag, session: session)
                    case .miFare(let tag):
                        self.readNDEF(tag: tag as! NFCMiFareTag, session: session)
                    @unknown default:
                        session.invalidate(errorMessage: "Unsupported tag")
                    }
                }
            }
        }
    }

    private func readNDEF(tag: NFCNDEFTag, session: NFCTagReaderSession) {
        tag.queryNDEFStatus { (status, capacity, error) in
            if let error = error {
                print("Error querying NDEF status: \(error)")
                session.invalidate(errorMessage: "Failed to query NDEF status")
                return
            }

            guard status == .readWrite || status == .readOnly else {
                session.invalidate(errorMessage: "Tag is not NDEF formatted")
                return
            }

            tag.readNDEF { (message, error) in
                if let error = error {
                    print("Error reading NDEF message: \(error)")
                    session.invalidate(errorMessage: "Failed to read NDEF message")
                    return
                }

                if let message = message {
                    DispatchQueue.main.async {
                        self.tagData = self.parseNDEFMessage(message)
                    }
                }
                session.invalidate()
            }
        }
    }

        private func parseNDEFMessage(_ message: NFCNDEFMessage) -> String {
        var result = ""
        for record in message.records {
            if record.typeNameFormat == .nfcWellKnown, let type = String(data: record.type, encoding: .utf8), type == "T" {
                let payload = record.payload
                let statusByte = payload.first!
                let languageCodeLength = Int(statusByte & 0x3F)
                let text = String(data: payload.advanced(by: 1 + languageCodeLength), encoding: .utf8) ?? ""
                result += text
            }
        }
        
        DispatchQueue.main.async {
            self.tagData = result
            self.onTagRead?(result)
        }
        
        return result
    }

    func tagReaderSessionDidBecomeActive(_ session: NFCTagReaderSession) {
        print("NFC Reader session became active")
    }

    func tagReaderSession(_ session: NFCTagReaderSession, didInvalidateWithError error: Error) {
        print("NFC Reader session invalidated with error: \(error)")
    }
}
