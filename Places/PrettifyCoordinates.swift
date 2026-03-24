//
//  PrettifyCoordinates.swift
//  Places
//
//  Created by henry on 3/24/26.
//

import MapKit
extension Place {
    func prettyString() -> String {
        let latDirection = lat >= 0 ? "N" : "S"
        let longDirection = long >= 0 ? "E" : "W"
        let latString = String(format: "%.5f %@", abs(lat), latDirection)
        let longString = String(format: "%.5f %@", abs(long), longDirection)
        return "\(latString), \(longString)"
    }
}
