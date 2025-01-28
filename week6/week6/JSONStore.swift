//
//  JSONStore.swift
//  week6
//
//  Created by Chaitanya Makkapati on 1/27/25.
//

import Foundation

class JSONStore {
    private let filename = "apilist.json"

    private var documentDirectory: URL {
        FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    }

    private var documentFileURL: URL {
        documentDirectory.appendingPathComponent(filename)
    }

    func loadJSON() -> [APIEntry]? {
        let fileManager = FileManager.default

        if fileManager.fileExists(atPath: documentFileURL.path) {
            return readJSON(from: documentFileURL)
        }

        if let bundleURL = Bundle.main.url(forResource: "apilist", withExtension: "json") {
            return readJSON(from: bundleURL)
        }

        print("JSON file not found.")
        return nil
    }

    func saveJSON(_ entries: [APIEntry]) {
        do {
            let data = try JSONEncoder().encode(entries)
            try data.write(to: documentFileURL, options: .atomic)
            print("JSON saved at: \(documentFileURL)")
        } catch {
            print("Failed to save JSON: \(error)")
        }
    }

    private func readJSON(from url: URL) -> [APIEntry]? {
        do {
            let data = try Data(contentsOf: url)
            let decoded = try JSONDecoder().decode(APIResponse.self, from: data)
            return decoded.entries
        } catch {
            print("Failed to decode JSON: \(error)")
            return nil
        }
    }
}
