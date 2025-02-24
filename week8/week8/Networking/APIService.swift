//
//  APIService.swift
//  week8
//
//  Created by Chaitanya Makkapati on 2/24/25.
//

import Foundation
import Combine
import UIKit

/// A service responsible for networking using Combine.
class APIService {
    static let shared = APIService()
    
    private let baseURL = "https://api.pexels.com/v1"
    private var apiKey: String
    
    private init() {
        // Load the API key from APIKeys.plist.
        if let path = Bundle.main.path(forResource: "APIKeys", ofType: "plist"),
           let dict = NSDictionary(contentsOfFile: path),
           let key = dict["PexelsAPIKey"] as? String {
            self.apiKey = key
        } else {
            fatalError("API Key not found. Please add your key in APIKeys.plist")
        }
    }
    
    /// Searches for photos matching the query.
    func searchPhotos(query: String, page: Int = 1) -> AnyPublisher<PhotoResponse, Error> {
        guard let encodedQuery = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
              let url = URL(string: "\(baseURL)/search?query=\(encodedQuery)&page=\(page)&per_page=15") else {
            return Fail(error: URLError(.badURL))
                .eraseToAnyPublisher()
        }
        
        var request = URLRequest(url: url)
        request.setValue(apiKey, forHTTPHeaderField: "Authorization")
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .map(\.data)
            .decode(type: PhotoResponse.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    /// Downloads an image from the provided URL.
    func downloadImage(url: URL) -> AnyPublisher<UIImage?, Never> {
        return URLSession.shared.dataTaskPublisher(for: url)
            .map { data, _ in UIImage(data: data) }
            .catch { _ in Just(nil) }
            .subscribe(on: DispatchQueue.global(qos: .background))
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
