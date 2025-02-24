//
//  SearchViewModel.swift
//  week8
//
//  Created by Chaitanya Makkapati on 2/24/25.
//

import Foundation
import Combine

/// The ViewModel for handling search logic.
class SearchViewModel: ObservableObject {
    @Published var query: String = ""
    @Published var photos: [Photo] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    private var cancellables = Set<AnyCancellable>()
    
    /// Performs a search using the current query.
    func search() {
        guard !query.isEmpty else {
            photos = []
            return
        }
        
        isLoading = true
        errorMessage = nil
        
        APIService.shared.searchPhotos(query: query)
            .sink(receiveCompletion: { [weak self] completion in
                self?.isLoading = false
                if case let .failure(error) = completion {
                    self?.errorMessage = error.localizedDescription
                }
            }, receiveValue: { [weak self] response in
                self?.photos = response.photos
            })
            .store(in: &cancellables)
    }
}
