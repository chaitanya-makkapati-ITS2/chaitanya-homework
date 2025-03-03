//
//  Untitled.swift
//  week9
//
//  Created by Chaitanya Makkapati on 2/27/25.
//

import Foundation

struct CatFactSequence: AsyncSequence {
    typealias Element = CatFact
    let count: Int

    func makeAsyncIterator() -> Iterator {
        Iterator(count: count)
    }

    struct Iterator: AsyncIteratorProtocol {
        let count: Int
        var current = 0

        mutating func next() async -> CatFact? {
            guard current < count else { return nil }
            current += 1

            do {
                let url = URL(string: "https://catfact.ninja/fact")!
                let (data, _) = try await URLSession.shared.data(from: url)
                let catFact = try JSONDecoder().decode(CatFact.self, from: data)
                return catFact
            } catch {
                print("Error fetching cat fact: \(error)")
                return nil
            }
        }
    }
}
