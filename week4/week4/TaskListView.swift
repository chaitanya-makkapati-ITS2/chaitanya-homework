//
//  TaskListView.swift
//  week4
//
//  Created by Chaitanya Makkapati on 1/2/25.
//

import SwiftUI

struct TaskListView: View {
    @StateObject private var store = TaskStore()

    var body: some View {
        NavigationStack {
            VStack {
                if store.tasks.isEmpty {
                    Text("No tasks available")
                        .font(.headline)
                        .foregroundColor(.gray)
                        .padding()
                } else {
                    ScrollView {
                        LazyVStack(alignment: .leading, spacing: 10) {
                            ForEach(store.tasks) { task in
                                NavigationLink(destination: TaskDetailView(task: task, store: store)) {
                                    HStack {
                                        Text(task.title)
                                            .font(.body)
                                            .frame(maxWidth: .infinity, alignment: .leading) // Title fills screen width
                                            .padding(.leading, 8)
                                        Image(systemName: task.isCompleted ? "checkmark.square" : "square")
                                            .foregroundColor(task.isCompleted ? .green : .red)
                                            .frame(width: 24, height: 24)
                                    }
                                    .padding()
                                    .background(Color(.secondarySystemBackground))
                                    .cornerRadius(8)
                                }
                            }
                        }
                        .padding(.horizontal)
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: NewTaskView(store: store)) {
                        Label("Add Task", systemImage: "plus.circle")
                            .labelStyle(.iconOnly)
                            .font(.title2)
                    }
                }
            }
            .navigationTitle("Task List")
        }
    }
}
