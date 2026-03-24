//
//  PlaceModel.swift
//  Places
//
//  Created by henry on 3/24/26.
//

struct Locations: Decodable {
    let locations: [Place]
}
struct Place: Decodable, Identifiable {
    var id: String { "\(long), \(lat)"}
    let name: String?
    let lat: Double
    let long: Double
}
