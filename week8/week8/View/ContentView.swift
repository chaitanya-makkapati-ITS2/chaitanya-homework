//
//  ContentView.swift
//  week8
//
//  Created by Chaitanya Makkapati on 2/14/25.
//

import SwiftUI

/// The main search view with a search bar and list of results.
struct ContentView: View {
    @StateObject var viewModel = SearchViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                // Search Bar
                HStack {
                    TextField("Search images...", text: $viewModel.query, onCommit: {
                        viewModel.search()
                    })
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                }
                
                // Loading Indicator
                if viewModel.isLoading {
                    ProgressView("Loading...")
                        .padding()
                }
                
                // Error Message
                if let errorMessage = viewModel.errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .padding()
                }
                
                
                // No Results Message
                
                if viewModel.photos.isEmpty && !viewModel.query.isEmpty && !viewModel.isLoading {
                    ContentUnavailableView(message: "No Images.")
                }

                
               
               
                
                // List of Search Results
                List(viewModel.photos) { photo in
                    NavigationLink(destination: PhotoDetailView(photo: photo)) {
                        PhotoRowView(photo: photo)
                    }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("Image Search")
        }
    }
}

#Preview {
    ContentView()
}
