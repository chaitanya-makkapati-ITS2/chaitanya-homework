//
//  TaskDetailView.swift
//  week4
//
//  Created by Chaitanya Makkapati on 1/2/25.
//

import SwiftUI

struct TaskDetailView: View {
    let task: Task
    @ObservedObject var store: TaskStore

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(task.title)
                .font(.title2)
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
            Toggle("Completed", isOn: Binding(
                get: { task.isCompleted },
                set: { newValue in
                    if let index = store.tasks.firstIndex(where: { $0.id == task.id }) {
                        store.tasks[index].isCompleted = newValue
                    }
                }
            ))
            .toggleStyle(SwitchToggleStyle(tint: .green))
            .padding(.vertical, 10)

            Text("Notes")
                .font(.headline)
            ScrollView {
                Text(task.notes)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(8)
            }
            Spacer()
        }
        .padding()
        .navigationTitle("Task Details")
    }
}
