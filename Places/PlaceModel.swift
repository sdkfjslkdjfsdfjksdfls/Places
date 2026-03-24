//
//  PlaceModel.swift
//  Places
//
//  Created by henry on 3/24/26.
//
import Foundation
struct Locations: Decodable {
    let locations: [Place]
}
struct Place: Decodable, Identifiable {
    var id: String { "\(long), \(lat)"}
    let name: String?
    let lat: Double
    let long: Double
    var displayName: String {
        name ?? "Untitled"
    }
    
    var url: URL? {
        //example: wikipedia://places?long=-3.7495758&lat=40.4380638
        guard var components = URLComponents(string: "wikipedia://places") else { return nil }
        components.queryItems = [
            URLQueryItem(name: "long", value: long.description),
            URLQueryItem(name: "lat", value: lat.description),
        ]
        return components.url
    }
    
    var prettyString: String {
        let latDirection = lat >= 0 ? "N" : "S"
        let longDirection = long >= 0 ? "E" : "W"
        let latString = String(format: "%.5f %@", abs(lat), latDirection)
        let longString = String(format: "%.5f %@", abs(long), longDirection)
        return "\(latString), \(longString)"
    }
}
