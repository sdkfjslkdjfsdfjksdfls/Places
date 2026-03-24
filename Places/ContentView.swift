//
//  ContentView.swift
//  Places
//
//  Created by henry on 3/24/26.
//

import SwiftUI

struct ContentView: View {
    @State var places: [Place] = []
    var body: some View {
        List(places) {
            PlaceView(place: $0)
        }.onAppear {
            Task {
                do {
                    try await places = PlacesClient().fetchLocations()
                } catch {
                    print(error)
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
