//
//  TodoStore.swift
//  week7
//
//  Created by Chaitanya Makkapati on 2/7/25.
//

import Foundation
import SwiftUI

class TodoStore: ObservableObject {
    @Published var todos: [Todo] = []
    @Published var isLoading = false
    @Published var error: Error?
    
    /// Fetches the todos from the remote URL asynchronously.
    func fetchTodos() async {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/todos") else { return }
        
        // Indicate loading has started.
        await MainActor.run {
            self.isLoading = true
        }
        
        do {
            // Fetch the data.
            let (data, _) = try await URLSession.shared.data(from: url)
            // Decode the JSON data into an array of Todo objects.
            let decodedTodos = try JSONDecoder().decode([Todo].self, from: data)
            // Update on the main thread.
            await MainActor.run {
                self.todos = decodedTodos
                self.isLoading = false
            }
        } catch {
            // Update the error property and stop loading.
            await MainActor.run {
                self.error = error
                self.isLoading = false
            }
        }
    }
}
