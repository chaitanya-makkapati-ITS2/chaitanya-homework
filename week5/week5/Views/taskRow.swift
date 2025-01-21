//
//  taskRow.swift
//  week5
//
//  Created by Chaitanya Makkapati on 1/21/25.
//

import SwiftUI

struct taskRow: View {
    @EnvironmentObject  var store: TaskStore
    var task: Task
    var body: some View {
        HStack {
            Text(task.title)
                .font(.body)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 8)
            Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                .resizable()
                .frame(width: 24, height: 24)
                .foregroundColor(task.isCompleted ? .green : .red)
                .rotationEffect(.degrees(task.isCompleted ? 360 : 0)) // Add rotation effect
                .animation(.easeInOut(duration: 0.5), value: task.isCompleted) // Smooth animation
                .onTapGesture {
                    withAnimation {
                        if let index = store.tasks.firstIndex(where: { $0.id == task.id }) {
                            store.tasks[index].isCompleted.toggle()
                        }
                    }
                }
        }
        .padding()
        .background(Color(.secondarySystemBackground))
        .cornerRadius(8)
    }
}
