//
//  ContentView.swift
//  Places
//
//  Created by henry on 3/24/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }.onAppear {
            Task {
                do {
                    try await print(PlacesClient().fetchLocations())
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
