//
//  BigDataManager.swift
//  Papalote_MTY
//
//  Created by alumno on 11/11/24.
//

import Foundation

import Foundation
import SwiftData


struct BigDataManager {
    @MainActor
    static func addBigData(to context: ModelContext) async {
        
        let fetch = await shouldFetch(to: context)
        
        if (fetch) {
            let fetchDate = FetchedDate(date: Date())
            
            var succeeded = true
            
            let zonas: [Zona]
            
            do {
                zonas = try await fetchZones()
            } catch {
                zonas = []
                succeeded = false
                print("Failed to fetch zones: \(error)")
            }
            
            let eventos: [Evento]
            
            do {
                eventos = try await fetchEvents()
            } catch {
                eventos = []
                succeeded = false
                print("Failed to fetch eventos: \(error)")
            }
            
            let insignias: [Insignia]
            do {
                insignias = try await fetchInsignias()
            } catch {
                insignias = []
                succeeded = false
                print("Failed to fetch insignias: \(error)")
            }
            
            let exhibiciones: [Exhibicion]
            
            do {
                exhibiciones = try await fetchExhibitions()
            } catch {
                exhibiciones = []
                succeeded = false
                print("Failed to fetch exhibiciones: \(error)")
            }
            
            let pines: [Pin]
            
            do {
                pines = try await fetchPins()
            } catch {
                pines = []
                succeeded = false
                print("Failed to fetch pins: \(error)")
            }
            
            // If any call fails do nothing: stay with previous correct values.
            // Prefer this option as it doesn´t corrupt entity relations
            if !succeeded {
                return
            } else {
                // Update the last fetch date
                let previousFetchedDate = try? context.fetch(FetchDescriptor<FetchedDate>())
                previousFetchedDate?.forEach { context.delete($0) }
                context.insert(fetchDate)
            }

            // zonas, eventos, insignias, exhibiciones, pines
            // Delete current values, insert new values
            
            let existingZonas = try? context.fetch(FetchDescriptor<Zona>())
            existingZonas?.forEach { context.delete($0) }
            
            let existingEventos = try? context.fetch(FetchDescriptor<Evento>())
            existingEventos?.forEach { context.delete($0) }
            
            let existingInsignias = try? context.fetch(FetchDescriptor<Insignia>())
            existingInsignias?.forEach { context.delete($0) }
            
            let existingExhibicion = try? context.fetch(FetchDescriptor<Exhibicion>())
            existingExhibicion?.forEach { context.delete($0) }
            
            let existingPines = try? context.fetch(FetchDescriptor<Pin>())
            existingPines?.forEach { context.delete($0)}
            
            for zona in zonas {
                context.insert(zona)
            }
            
            for evento in eventos {
                context.insert(evento)
            }
            
            for insignia in insignias {
                context.insert(insignia)
            }
            
            for exhibicion in exhibiciones {
                context.insert(exhibicion)
            }
            
            for pin in pines {
                context.insert(pin)
            }
                        
            do {
                try context.save()
                print("Successfully saved the context.")
            } catch {
                print("Failed to save the context: \(error)")
            }
        }
    }
    
    @MainActor
    static func shouldFetch(to context: ModelContext) async -> Bool {
        let lastFetch = getLastFetchDate(to: context)
        
        let lastUpdate: Date
        do {
            lastUpdate = try await getLastUpdate()
        } catch {
            print("Failed to fetch last update from website. Re-fetching")
            lastUpdate = Date()
        }
        // If app data is outdated, the info should be updated
        return lastUpdate > lastFetch
    }
    
    
    static func getLastFetchDate(to context: ModelContext) -> Date {
        do {
            let lastFetchDate = try context.fetch(FetchDescriptor<FetchedDate>())
            
            if let firstFetchDate = lastFetchDate.first {
                return firstFetchDate.date
            } else {
                print("No last fetch data found, returning default date.")
                return Date(timeIntervalSince1970: 0)
            }
        } catch {
            print("Error fetching last fetch date: \(error)")
            return Date(timeIntervalSince1970: 0)
        }
    }
    
    static func getLastUpdate() async throws -> Date {
        guard let url = URL(string: "https://papalote-dashboard.vercel.app/api/data?type=lastUpdate") else {
            throw URLError(.badURL)
        }
        
        do {
            let decoder = JSONDecoder()
            let dateFormatter = DateFormatter()

            dateFormatter.locale = Locale(identifier: "en_US_POSIX")
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
            decoder.dateDecodingStrategy = .formatted(dateFormatter)
            
            let (data, _) = try await URLSession.shared.data(from: url)
            let decodedResponse = try decoder.decode(LastUpdate.self, from: data)
            return decodedResponse.date
        } catch {
            print("Failed to fetch in getLastUpdate: \(error)")
            throw error
        }

    }
    
    
    
}

func sendZoneVisitRequest(exhibitionId: String) async throws {
    guard let url = URL(string: "https://papalote-dashboard.vercel.app/api/visit") else {
        throw URLError(.badURL)
    }

    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")

    let visitRequest = ZoneVisit(exhibitionId: exhibitionId)
    let encoder = JSONEncoder()
    request.httpBody = try encoder.encode(visitRequest)

    let (_, response) = try await URLSession.shared.data(for: request)

    guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
        throw URLError(.badServerResponse)
    }

    // Handle the response data if needed
    print("Visit request sent successfully")
}



func sendMuseumEntranceRequest(isEntrance: Bool) async throws {
    guard let url = URL(string: "https://papalote-dashboard.vercel.app/api/visit") else{
        throw URLError(.badURL)
    }
    var request = URLRequest(url:url)
    request.httpMethod = "POST"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    
    let exhibitionEntrance = MuseumEntrance(isEntrance: isEntrance)
    let encoder = JSONEncoder()
    request.httpBody = try encoder.encode(exhibitionEntrance)
    
    let (_, response) = try await URLSession.shared.data(for: request)

    guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
        throw URLError(.badServerResponse)
    }
    // Handle the response data if needed
    print("Museum Entrance sent successfully")
}



struct ZonaResponse: Codable {
    let zones: [Zona]
}

struct EventoResponse: Codable {
    let events: [Evento]
}

struct InsigniaResponse: Codable {
    let insignias: [Insignia]
}

struct ExhibitionResponse: Codable {
    let exhibitions: [Exhibicion]
}

struct PinResponse: Codable {
    let pins: [Pin]
}

func fetchZones() async throws -> [Zona] {
    guard let url = URL(string: "https://papalote-dashboard.vercel.app/api/data?type=zones") else {
        throw URLError(.badURL)
    }
    
    do {
        let (data, _) = try await URLSession.shared.data(from: url)
        let decodedResponse = try JSONDecoder().decode(ZonaResponse.self, from: data)
        return decodedResponse.zones
    } catch {
        throw error
    }
}

func fetchEvents() async throws -> [Evento] {
    guard let url = URL(string: "https://papalote-dashboard.vercel.app/api/data?type=events") else {
        throw URLError(.badURL)
    }
    
    do {
        let decoder = JSONDecoder()
        let dateFormatter = DateFormatter()

        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        decoder.dateDecodingStrategy = .formatted(dateFormatter)
        let (data, _) = try await URLSession.shared.data(from: url)
        let decodedResponse = try decoder.decode(EventoResponse.self, from: data)
        return decodedResponse.events
    } catch {
        throw error
    }
}

func fetchInsignias() async throws -> [Insignia] {
    guard let url = URL(string: "https://papalote-dashboard.vercel.app/api/data?type=insignias") else {
        throw URLError(.badURL)
    }
    
    do {
        let (data, _) = try await URLSession.shared.data(from: url)
        let decodedResponse = try JSONDecoder().decode(InsigniaResponse.self, from: data)
        return decodedResponse.insignias
    } catch {
        throw error
    }
}

func fetchExhibitions() async throws -> [Exhibicion] {
    guard let url = URL(string: "https://papalote-dashboard.vercel.app/api/data?type=exhibitions") else {
        throw URLError(.badURL)
    }
    
    do {
        let (data, _) = try await URLSession.shared.data(from: url)
        let decodedResponse = try JSONDecoder().decode(ExhibitionResponse.self, from: data)
        return decodedResponse.exhibitions
    } catch {
        throw error
    }
}

func fetchPins() async throws -> [Pin] {
    guard let url = URL(string: "https://papalote-dashboard.vercel.app/api/data?type=pins") else {
        throw URLError(.badURL)
    }
    
    do {
        let (data, _) = try await URLSession.shared.data(from: url)
        let decodedResponse = try JSONDecoder().decode(PinResponse.self, from: data)
        return decodedResponse.pins
    } catch {
        throw error
    }
}

