//
//  PlacesTests.swift
//  PlacesTests
//
//  Created by henry on 3/24/26.
//

import XCTest
@testable import Places
extension URL {
    func valueOf(_ queryParameterName: String) -> String? {
        guard let url = URLComponents(string: self.absoluteString) else { return nil }
        return url.queryItems?.first(where: { $0.name == queryParameterName })?.value
    }
}
final class PlacesTests: XCTestCase {
    //example: wikipedia://places?long=-3.7495758&lat=40.4380638
    func testPlaceURL() throws {
        let expectedLat = 40.7143
        let expectedLong = -74.006
        let place = Place(name: "New York City", lat: expectedLat, long: expectedLong)
        guard let url = place.url else {
            XCTFail("URL for \(place) is nil")
            return
        }
        if let lat = url.valueOf("lat"){
            XCTAssertEqual(Double(lat), expectedLat)
        } else {
            XCTFail("lat query param is nil")
        }
        if let long = url.valueOf("long"){
            XCTAssertEqual(Double(long), expectedLong)
        } else {
            XCTFail("long query param is nil")
        }
    }
    
    func testPrettyStringNorthEast() {
        let positivePlace = Place(name: nil, lat: 52.123, long: 4.231)
        let result = positivePlace.prettyString

        XCTAssertEqual(result, "52.12300 N, 4.23100 E")
    }
    
    func testPrettyStringSouthWest() {
        let place = Place(name: nil, lat: -33.8688, long: -151.2093)
        let result = place.prettyString
        
        XCTAssertEqual(result, "33.86880 S, 151.20930 W")
    }
    
    
    func testPrettyStringNorthWest() {
        let place = Place(name: nil, lat: 52, long: -4)
        let result = place.prettyString
        
        XCTAssertEqual(result, "52.00000 N, 4.00000 W")
    }
    
    func testPrettyStringSouthEast() {
        let place = Place(name: nil, lat: -52, long: 4)
        let result = place.prettyString
        
        XCTAssertEqual(result, "52.00000 S, 4.00000 E")
    }
    
    func testLongitude() {
        XCTAssertEqual(
            FormValidator.validateCoordinate("", coordinateType: .longitude),
            FormError.missingLongitude
        )
        
        XCTAssertEqual(
            FormValidator.validateCoordinate("196", coordinateType: .longitude),
            FormError.invalidLongitude
        )
        
        XCTAssertEqual(
            FormValidator.validateCoordinate("rubiks", coordinateType: .longitude),
            FormError.invalidLongitude
        )
    }
    
    func testLatitude() {
        
        XCTAssertEqual(
            FormValidator.validateCoordinate("", coordinateType: .latitude),
            FormError.missingLatitude
        )
        
        XCTAssertEqual(
            FormValidator.validateCoordinate("123", coordinateType: .latitude),
            FormError.invalidLatitude
        )
        
        XCTAssertEqual(
            FormValidator.validateCoordinate("rubiks", coordinateType: .latitude),
            FormError.invalidLatitude
        )
    }
}
