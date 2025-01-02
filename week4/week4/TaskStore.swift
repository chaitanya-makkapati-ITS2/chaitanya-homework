//
//  TaskStore.swift
//  week4
//
//  Created by Chaitanya Makkapati on 1/2/25.
//

import Foundation


/// A view model to manage the tasks.
class TaskStore: ObservableObject {
    @Published var tasks: [Task] = []
    
    /// Adds a new task to the store.
    func addTask(title: String, notes: String) {
        tasks.append(Task(title: title, isCompleted: false, notes: notes))
    }
}

