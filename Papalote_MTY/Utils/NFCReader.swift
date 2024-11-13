//
//  NFCReader.swift
//  Papalote_MTY
//
//  Created by José Guerrero  on 11/11/24.
//

import CoreNFC
import Combine

class NFCReader: NSObject, ObservableObject, NFCTagReaderSessionDelegate {
    @Published var tagData: Data?
    private var readerSession: NFCTagReaderSession?

    func startReading() {
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
                        self.tagData = tag.identifier
                    case .iso15693(let tag):
                        self.tagData = tag.identifier
                    case .miFare(let tag):
                        self.tagData = tag.identifier
                    @unknown default:
                        session.invalidate(errorMessage: "Unsupported tag")
                    }
                    session.invalidate()
                }
            }
        }
    }

    func tagReaderSessionDidBecomeActive(_ session: NFCTagReaderSession) {
        print("NFC Reader session became active")
    }

    func tagReaderSession(_ session: NFCTagReaderSession, didInvalidateWithError error: Error) {
        print("NFC Reader session invalidated with error: \(error)")
    }
}