//
//  TaskModel.swift
//  week5
//
//  Created by Chaitanya Makkapati on 1/14/25.
//

import Foundation

enum TaskCategory: String, CaseIterable {
    case work = "Work"
    case personal = "Personal"
    case others = "Home"
    case uncategorized = "No Category"
}

struct Task: Identifiable , Equatable {
    let id = UUID()
    var title: String
    var isCompleted: Bool
    var notes: String
    var category: TaskCategory
}

