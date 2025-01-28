//
//  ContentView.swift
//  week6
//
//  Created by Chaitanya Makkapati on 1/27/25.
//

import SwiftUI

struct ContentView: View {
    @State private var entries: [APIEntry] = []
    private let store = JSONStore()

    var body: some View {
        NavigationView {
            List(entries, id: \.id) { entry in
                NavigationLink(destination: APIDetailView(entry: entry)) {
                    Text(entry.api) // Display API name
                }
            }
            .navigationTitle("API List")
            .onAppear(perform: loadData)
        }
    }

    private func loadData() {
        if let savedEntries = store.loadJSON() {
            entries = savedEntries
        } else {
            entries = []
        }
    }
}

#Preview {
    ContentView()
}
