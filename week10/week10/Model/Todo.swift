//
//  Todo.swift
//  week7
//
//  Created by Chaitanya Makkapati on 2/7/25.
//

import Foundation

struct Todo: Identifiable, Codable, Hashable {
    let userId: Int?
    let id: Int?
    let title: String?
    let completed: Bool?
}
