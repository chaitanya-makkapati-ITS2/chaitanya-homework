//
//  APIModel.swift
//  week6
//
//  Created by Chaitanya Makkapati on 1/27/25.
//

import Foundation


struct APIList: Codable {
    let count: Int
    let entries: [APIEntry]
}


struct APIEntry: Identifiable, Codable {
    var id: UUID { UUID() }
    let api: String?
    let description: String?
    let auth: String?
    let https: Bool?
    let cors: String?
    let link: String?
    let category: String?

    enum CodingKeys: String, CodingKey {
        case api = "API"
        case description = "Description"
        case auth = "Auth"
        case https = "HTTPS"
        case cors = "Cors"
        case link = "Link"
        case category = "Category"
    }
}


extension APIEntry {
    init(from entity: APIEntity) {
        self.api = entity.api ?? "Unknown API"
        self.description = entity.descriptionText ?? ""
        self.auth = entity.auth ?? "No Auth"  // Provide a default value
        self.https = entity.https
        self.cors = entity.cors ?? ""
        self.link = entity.link ?? ""
        self.category = entity.category ?? ""
    }
}


