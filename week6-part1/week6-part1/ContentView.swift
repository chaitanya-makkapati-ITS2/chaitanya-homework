//
//  ContentView.swift
//  week6-part1
//
//  Created by Chaitanya Makkapati on 1/27/25.
//

import SwiftUI

struct ContentView: View {
    @State private var entries: [APIEntry] = []
    @State private var showError: Bool = false
    private let store = JSONStore()

    var body: some View {
        NavigationView {
            List(entries, id: \.id) { entry in
                NavigationLink(destination: APIDetailView(entry: entry)) {
                    Text(entry.api ?? "Unknown API") // Display API name
                }
            }
            .navigationTitle("API List")
            .onAppear(perform: loadData)
            .alert("Error", isPresented: $showError) {
                Button("OK", role: .cancel) { }
            } message: {
                Text("Failed to load JSON data from both the app bundle and the user's document directory.")
            }
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
