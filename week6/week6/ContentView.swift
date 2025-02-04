//
//  ContentView.swift
//  week6
//
//  Created by Chaitanya Makkapati on 1/27/25.
//

import SwiftUI

struct ContentView: View {
    @State private var entries: [APIEntity] = []

    var body: some View {
        NavigationView {
            List(entries, id: \.objectID) { entity in
                NavigationLink(destination: APIDetailView(entry: APIEntry(from: entity))) {
                    Text(entity.api ?? "Unknown API")
                }
            }
            .navigationTitle("API List")
            .onAppear(perform: loadData)
        }
    }

    private func loadData() {
        
        entries = CoreDataManager.shared.fetchEntries()
        
        if entries.isEmpty {
            print("No Core Data entries found. Loading apilist.json...")
            if let jsonEntries = loadEntriesFromJSON() {
                CoreDataManager.shared.saveEntries(jsonEntries)
                entries = CoreDataManager.shared.fetchEntries()
            } else {
                print("Failed to load entries from apilist.json")
            }
        }
    }

}

#Preview {
    ContentView()
}
