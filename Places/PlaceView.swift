//
//  PlaceView.swift
//  Places
//
//  Created by henry on 3/24/26.
//
import SwiftUI

struct PlaceView: View {
    let place: Place
    @Environment(\.openURL) private var openURL

    var body: some View {
        HStack {
            HStack {
                VStack(alignment: .leading) {
                    Text(place.name ?? "Untitled")
                    Text("Coordinates: \(place.lat), \(place.long)")
                }
                Spacer()
                Button("View in 'Places'",
                       systemImage: "mappin",
                       action: openPlace
                ).buttonStyle(.borderedProminent)
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
