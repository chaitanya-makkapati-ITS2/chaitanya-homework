//
//  JSONStore.swift
//  week6-part1
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
        // First, try to load from the app bundle
         if let bundleURL = Bundle.main.url(forResource: filename, withExtension: nil) {
            if let entries = readJSON(from: bundleURL) {
                // Save the JSON to the document directory for future use
                saveJSON(entries)
                return entries
            } else {
                print("Invalid JSON in app bundle.")
            }
        }

        // If not in the document directory, try the document directory
       else if fileManager.fileExists(atPath: documentFileURL.path) {
            if let entries = readJSON(from: documentFileURL) {
                return entries
            } else {
                print("Invalid JSON in document directory.")
            }
        }
       
        

        // If neither location contains the file, print an error
        print("JSON file not found in both the app bundle and the user's document directory.")
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
