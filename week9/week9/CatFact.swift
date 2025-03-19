//
//  CatFact.swift
//  week9
//
//  Created by Chaitanya Makkapati on 2/27/25.
//
import Foundation

struct CatFact: Codable, Identifiable {
    var id: UUID { UUID() }
    let fact: String
    let length: Int
}

