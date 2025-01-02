//
//  TaskModel.swift
//  week4
//
//  Created by Chaitanya Makkapati on 1/2/25.
//

import Foundation

/// A model representing a Task in the app.
struct Task: Identifiable {
    let id = UUID()
    var title: String
    var isCompleted: Bool
    var notes: String
}
