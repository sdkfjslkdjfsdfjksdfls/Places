//
//  RESTClient.swift
//  Places
//
//  Created by henry on 3/24/26.
//

import Foundation
struct Locations: Decodable {
    let locations: [Place]
}
struct Place: Decodable {
    let name: String?
}

class PlacesClient {
    enum NetworkingError: Error {
        case decodingFailed(error: Error)
        case invalidURL(url: String)
        case invalidResponse(statusCode: Int)
        case other(error: Error)
    }
    
    static var locationsURL = "https://raw.githubusercontent.com/abnamrocoesd/assignment-ios/main/locations.json"
    func fetchLocations() async throws (NetworkingError) -> [Place] {
        do {
            guard let url = URL(string: Self.locationsURL) else {
                throw NetworkingError.invalidURL(url: Self.locationsURL)
            }
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            let (data, response) = try await URLSession.shared.data(for: request)
            
            guard let statusCode = (response as? HTTPURLResponse)?.statusCode else {
                throw NetworkingError.invalidResponse(statusCode: -1)
            }
            
            guard (200...299).contains(statusCode) else {
                throw NetworkingError.invalidResponse(statusCode: statusCode)
            }
            let decodedResponse = try JSONDecoder().decode(Locations.self, from: data)
            return decodedResponse.locations
        } catch let error as DecodingError {
            throw .decodingFailed(error: error)
        } catch let error as NetworkingError {
            throw error
        } catch {
            throw .other(error: error)
        }
    }
}
