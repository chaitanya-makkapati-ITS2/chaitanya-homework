//
//  TaskStore.swift
//  week5
//
//  Created by Chaitanya Makkapati on 1/14/25.
//

import Foundation

/// A view model to manage the tasks.
class TaskStore: ObservableObject {
    @Published var tasks: [Task] = []
    
    /// Adds a new task to the store.
    func addTask(title: String, notes: String, category: TaskCategory) {
        tasks.append(Task(title: title, isCompleted: false, notes: notes, category: category))
    }
}
