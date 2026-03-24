//
//  ContentView.swift
//  Places
//
//  Created by henry on 3/24/26.
//

import SwiftUI

struct ContentView: View {
    @State var places: [Place] = []
    @State private var showingAddPlace = false
    
    var body: some View {
        NavigationStack {
            List(places) {
                PlaceView(place: $0)
            }
            .navigationTitle("Places")
            .toolbar {
                Button {
                    showingAddPlace = true
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
        .sheet(isPresented: $showingAddPlace) {
            AddPlaceView { newPlace in
                places.append(newPlace)
            }
        }
        .onAppear {
            Task {
                do {
                    places = try await PlacesClient().fetchLocations()
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
