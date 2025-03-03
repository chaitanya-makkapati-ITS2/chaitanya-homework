//
//  CatFactViewModel.swift
//  week9
//
//  Created by Chaitanya Makkapati on 2/27/25.
//

import Foundation
import SwiftUI

@MainActor
class CatFactViewModel: ObservableObject {
    @Published var catFacts: [CatFact] = []
    
    /// Asynchronously fetches the specified number of cat facts.
    func fetchFacts(count: Int) async {
        // clearing  all the previous facts
        catFacts.removeAll()
        let sequence = CatFactSequence(count: count)
        for await fact in sequence {
            catFacts.append(fact)
        }
    }
}
