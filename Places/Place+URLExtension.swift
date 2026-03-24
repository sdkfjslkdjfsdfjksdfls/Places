//
//  Place+URLExtension.swift
//  Places
//
//  Created by henry on 3/24/26.
//
import Foundation
extension Place {
    var url: URL? {
        guard var components = URLComponents(string: "wikipedia://places") else { return nil }
        components.queryItems = [
            URLQueryItem(name: "longitude", value: long.description),
            URLQueryItem(name: "longitude", value: lat.description),
            URLQueryItem(name: "name", value: name ?? "Untitled")
        ]
        return components.url
    }
}
