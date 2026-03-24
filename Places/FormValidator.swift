//
//  FormValidator.swift
//  Places
//
//  Created by henry on 3/24/26.
//
import Foundation
enum FormError: Error, LocalizedError {
    case invalidLatitude
    case invalidLongitude
    case missingLatitude
    case missingLongitude
    
    var errorDescription: String? {
        switch self {
        case .invalidLatitude:
            return "Latitude must be between -90 and 90"
        case .invalidLongitude:
            return "Latitude must be between -180 and 180"
        case .missingLatitude:
            return "Latitude is a required field"
        case .missingLongitude:
            return "Longitude is a required field"
        }
    }
}
enum FormValidator {
    enum CoordinateType {
        case latitude
        case longitude
    }
    
    static func validateCoordinate(_ coordinate: String, coordinateType: CoordinateType) -> FormError? {
        guard !coordinate.isEmpty else {
            switch coordinateType {
            case .latitude: return .missingLatitude
            case .longitude: return .missingLongitude
            }
        }
        
        let max: Double = coordinateType == .latitude ? 90 : 180
        guard let coordinateDouble = Double(coordinate),
              abs(coordinateDouble) <= max else {
            return coordinateType == .latitude ? .invalidLatitude : .invalidLongitude
        }
        return nil
    }
}



