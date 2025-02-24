//
//  PhotoRowView.swift
//  week8
//
//  Created by Chaitanya Makkapati on 2/24/25.
//

import SwiftUI

/// A row view that displays a photo thumbnail.
struct PhotoRowView: View {
    let photo: Photo
    @StateObject private var imageLoader: ImageLoader
    
    init(photo: Photo) {
        self.photo = photo
        // Use the small image URL for thumbnails.
        let url = URL(string: photo.src.small) ?? URL(string: "https://via.placeholder.com/100")!
        _imageLoader = StateObject(wrappedValue: ImageLoader(url: url))
    }
    
    var body: some View {
        HStack {
            if let image = imageLoader.image {
                Image(uiImage: image)
                    .resizable()
                    .frame(width: 100, height: 100)
                    .aspectRatio(contentMode: .fill)
                    .clipped()
            } else {
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
                    .frame(width: 100, height: 100)
                    .overlay(ProgressView())
            }
            VStack(alignment: .leading) {
                Text(photo.photographer)
                    .font(.headline)
                Text("ID: \(photo.id)")
                    .font(.subheadline)
            }
        }
        .onAppear {
            imageLoader.load()
        }
    }
}
