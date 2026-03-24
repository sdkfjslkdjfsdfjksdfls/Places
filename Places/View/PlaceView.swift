//
//  PlaceView.swift
//  Places
//
//  Created by henry on 3/24/26.
//
import SwiftUI

struct PlaceView: View {
    var place: Place
    @Environment(\.openURL) private var openURL

    var body: some View {
        HStack {
            HStack {
                VStack(alignment: .leading) {
                    Text(place.displayName).font(.title2)
                    Text(place.prettyString)
                }
                .accessibilityElement(children: .combine)
                .accessibilityLabel("Name: \(place.displayName), coordinates: \(place.prettyString)")
                Spacer()
                Button("View in 'Wikipedia'",
                       action: openPlace
                )
                .accessibilityHint("View \(place.displayName) in Wikipedia")
                .buttonStyle(.borderedProminent)
            }
        }
    }
    
    func openPlace() {
        if let url = place.url {
            openURL(url)
        }
    }
}


#Preview {
    PlaceView(place: .init(name: "Amsterdam", lat: 1, long: 1))
}
