//
//  helper.swift
//  week6
//
//  Created by Chaitanya Makkapati on 2/4/25.
//

import Foundation

func loadEntriesFromJSON() -> [APIEntry]? {
    guard let url = Bundle.main.url(forResource: "apilist", withExtension: "json") else {
        print("apilist.json not found in bundle")
        return nil
    }
    
    do {
        let data = try Data(contentsOf: url)
        let decoder = JSONDecoder()
        let apiList = try decoder.decode(APIList.self, from: data)
        return apiList.entries
    } catch {
        print("Error decoding apilist.json: \(error)")
        return nil
    }
}
