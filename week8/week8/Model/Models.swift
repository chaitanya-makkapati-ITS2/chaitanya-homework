//
//  Models.swift
//  week8
//
//  Created by Chaitanya Makkapati on 2/24/25.
//

import Foundation


struct PhotoResponse: Codable {
    let total_results: Int
    let page: Int
    let per_page: Int
    let photos: [Photo]
    let next_page: String?
}

struct Photo: Codable, Identifiable {
    let id: Int
    let width: Int
    let height: Int
    let url: String
    let photographer: String
    let photographer_url: String
    let photographer_id: Int
    let avg_color: String?
    let src: PhotoSrc
}

struct PhotoSrc: Codable {
    let original: String
    let large2x: String
    let large: String
    let medium: String
    let small: String
    let portrait: String
    let landscape: String
    let tiny: String
}
