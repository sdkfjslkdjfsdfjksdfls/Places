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
        NavigationView {
            List(places) {
                PlaceView(place: $0)
            }
            .navigationTitle("Places")
        }
        .onAppear {
            Task {
                do {
                    try await places = PlacesClient().fetchLocations()
                } catch {
                    print(error)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
