//
//  ImageLoader.swift
//  week8
//
//  Created by Chaitanya Makkapati on 2/24/25.
//

import Foundation
import Combine
import UIKit

/// An observable object that loads an image and publishes updates.
class ImageLoader: ObservableObject {
    @Published var image: UIImage?
    private var cancellable: AnyCancellable?
    let url: URL
    
    init(url: URL) {
        self.url = url
    }
    
    deinit {
        cancellable?.cancel()
    }
    
    /// Loads the image, first checking the cache.
    func load() {
        let nsUrl = url as NSURL
        if let cachedImage = ImageCache.shared.image(for: nsUrl) {
            self.image = cachedImage
            return
        }
        cancellable = APIService.shared.downloadImage(url: url)
            .sink { [weak self] image in
                guard let self = self, let image = image else { return }
                ImageCache.shared.set(image: image, for: nsUrl)
                self.image = image
            }
    }
}
