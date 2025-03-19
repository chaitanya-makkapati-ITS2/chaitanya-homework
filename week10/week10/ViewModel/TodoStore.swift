//
//  TodoStore.swift
//  week7
//
//  Created by Chaitanya Makkapati on 2/7/25.
//

import Foundation
import SwiftUI

/// MARK: - Network Service Protocol

protocol NetworkServiceProtocol {
    func data(from url: URL) async throws -> (Data, URLResponse)
}

extension URLSession: NetworkServiceProtocol {}

/// MARK: - TodoStore (ViewModel)

class TodoStore: ObservableObject {
    @Published var todos: [Todo] = []
    @Published var isLoading = false
    @Published var error: Error?
    
    let networkService: NetworkServiceProtocol
    
    // Dependency injection via initializer
    init(networkService: NetworkServiceProtocol = URLSession.shared) {
        self.networkService = networkService
    }
    
    /// Fetches the todos from the remote URL asynchronously.
    func fetchTodos() async {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/todos") else { return }
        
        // Indicate loading has started.
        await MainActor.run {
            self.isLoading = true
        }
        
        do {
            // Use the injected network service to fetch data.
            let (data, _) = try await networkService.data(from: url)
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
