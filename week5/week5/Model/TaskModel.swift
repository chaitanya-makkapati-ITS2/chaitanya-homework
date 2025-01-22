//
//  TaskModel.swift
//  week5
//
//  Created by Chaitanya Makkapati on 1/14/25.
//

import Foundation

enum Category: String, CaseIterable {
    case work = "Work"
    case personal = "Personal"
    case home = "Home"
    case noCategory = "No Category"
}

struct Task: Identifiable , Equatable {
    let id = UUID()
    var title: String
    var isCompleted: Bool
    var notes: String
    var category: Category
}

