//
//  TaskDetailView.swift
//  week5
//
//  Created by Chaitanya Makkapati on 1/14/25.
//

import SwiftUI

struct TaskDetailView: View {
    @State var task: Task // Use @State to make the task editable locally
    @ObservedObject var store: TaskStore

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(task.title)
                .font(.title2)
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)

            // Toggle for Completion Status
            Toggle("Completed", isOn: $task.isCompleted)
                .toggleStyle(SwitchToggleStyle(tint: .green))
                .padding(.vertical, 10)
                .onChange(of: task.isCompleted) {
                    if let index = store.tasks.firstIndex(where: { $0.id == task.id }) {
                        store.tasks[index].isCompleted.toggle()
                    }
                }

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
