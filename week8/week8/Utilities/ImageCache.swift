//
//  ImageCache.swift
//  week8
//
//  Created by Chaitanya Makkapati on 2/24/25.
//
import UIKit

/// A simple image cache to improve performance.
class ImageCache {
    static let shared = ImageCache()
    private let cache = NSCache<NSURL, UIImage>()
    
    func image(for url: NSURL) -> UIImage? {
        return cache.object(forKey: url)
    }
    
    func set(image: UIImage, for url: NSURL) {
        cache.setObject(image, forKey: url)
    }
}

