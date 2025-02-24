//
//  PhotoDetailView.swift
//  week8
//
//  Created by Chaitanya Makkapati on 2/24/25.
//

import SwiftUI

/// A detail view that displays a larger version of the selected photo.
struct PhotoDetailView: View {
    let photo: Photo
    @StateObject private var imageLoader: ImageLoader
    
    init(photo: Photo) {
        self.photo = photo
        // Use the large2x image URL for detail view.
        let url = URL(string: photo.src.large2x) ?? URL(string: "https://via.placeholder.com/600")!
        _imageLoader = StateObject(wrappedValue: ImageLoader(url: url))
    }
    
    var body: some View {
        VStack {
            if let image = imageLoader.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
            } else {
                ProgressView("Loading Image...")
                    .onAppear {
                        imageLoader.load()
                    }
            }
        }
        .navigationTitle("Photo by \(photo.photographer)")
        .padding()
    }
}
