//
//  TaskListView.swift
//  week5
//
//  Created by Chaitanya Makkapati on 1/14/25.
//

import SwiftUI

struct TaskListView: View {
    @StateObject private var store = TaskStore()
    @State private var searchText = ""
    @State private var selectedCategory: TaskCategory? = nil

    var body: some View {
        TabView {
            // Incomplete Tasks Tab
            NavigationStack {
                VStack {
                    if filteredTasks(isCompleted: false).isEmpty {
                        Text("No tasks available")
                            .font(.headline)
                            .foregroundColor(.gray)
                            .padding()
                    } else {
                        List {
                            ForEach(filteredTasks(isCompleted: false)) { task in
                                NavigationLink(destination: TaskDetailView(task: task, store: store)) {
                                    taskRow(task: task)
                                }
                            }
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
                .navigationTitle("Tasks")
                .searchable(text: $searchText)
            }
            .tabItem {
                Label("Tasks", systemImage: "list.bullet.circle")
            }

            // Completed Tasks Tab
            NavigationStack {
                VStack {
                    if filteredTasks(isCompleted: true).isEmpty {
                        Text("No completed tasks")
                            .font(.headline)
                            .foregroundColor(.gray)
                            .padding()
                    } else {
                        List {
                            ForEach(filteredTasks(isCompleted: true)) { task in
                                NavigationLink(destination: TaskDetailView(task: task, store: store)) {
                                    taskRow(task: task)
                                }
                            }
                        }
                    }
                }
                .navigationTitle("Completed")
            }
            .tabItem {
                Label("Completed", systemImage: "checkmark.circle")
            }

            // Categories Tab
            NavigationStack {
                VStack {
                    // Grid for Categories
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                        ForEach(TaskCategory.allCases, id: \.self) { category in
                            categoryCard(category: category)
                        }
                    }
                    .padding()

                    // List of Tasks
                    List {
                        ForEach(filteredTasksByCategory()) { task in
                            NavigationLink(destination: TaskDetailView(task: task, store: store)) {
                                taskRow(task: task)
                            }
                        }
                    }
                }
                .navigationTitle("Categories")
            }
            .tabItem {
                Label("Categories", systemImage: "square.grid.2x2")
            }
        }
    }

    // Helper Methods
    private func filteredTasks(isCompleted: Bool) -> [Task] {
        store.tasks.filter { $0.isCompleted == isCompleted && (searchText.isEmpty || $0.title.localizedCaseInsensitiveContains(searchText)) }
    }

    private func filteredTasksByCategory() -> [Task] {
        guard let category = selectedCategory else { return store.tasks }
        return store.tasks.filter { $0.category == category }
    }

    private func taskRow(task: Task) -> some View {
        HStack {
            Text(task.title)
                .font(.body)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 8)
            Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                .resizable()
                .frame(width: 24, height: 24)
                .foregroundColor(task.isCompleted ? .green : .red)
                .scaleEffect(task.isCompleted ? 1.5 : 1.0)
                .animation(.spring(response: 0.4, dampingFraction: 0.6, blendDuration: 0.5), value: task.isCompleted)
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


    private func categoryCard(category: TaskCategory) -> some View {
        VStack {
            Text(category.rawValue)
                .font(.headline)
                .foregroundColor(.white)
            Text("\(store.tasks.filter { $0.category == category }.count) tasks")
                .font(.subheadline)
                .foregroundColor(.white.opacity(0.8))
        }
        .frame(maxWidth: .infinity, minHeight: 100)
        .background(categoryColor(for: category))
        .cornerRadius(8)
        .shadow(radius: 5)
        .onTapGesture {
            if selectedCategory == category {
                selectedCategory = nil
            } else {
                selectedCategory = category
            }
        }
    }

    private func categoryColor(for category: TaskCategory) -> Color {
        switch category {
        case .work:
            return Color.blue
        case .personal:
            return Color.green
        case .others:
            return Color.orange
        case .uncategorized:
            return Color.gray
        }
    }
}
