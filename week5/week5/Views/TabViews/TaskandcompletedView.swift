//
//  TaskandcompletedView.swift
//  week5
//
//  Created by Chaitanya Makkapati on 1/21/25.
//
import SwiftUI

struct TaskandcompletedView: View {
    @EnvironmentObject  var store: TaskStore
    @State private var searchText = ""
    var label: String
    var label2: String
    var completionFilter: Bool
    var body: some View {
        NavigationStack {
            VStack {
                if filteredTasks().isEmpty {
                    
                    Text("\(label)")
                        .font(.headline)
                        //.foregroundColor(.gray)
                        .padding()
                } else {
                    ScrollView {
                        ForEach(filteredTasks()) { task in
                            NavigationLink(destination: TaskDetailView(task: task, store: store)) {
                                VStack {
                                    taskRow(task: task)
                                    Divider()
                                }
                                .padding([.leading, .trailing], 20)
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
            .navigationTitle("\(label2)")
            .searchable(text: $searchText)
            
        }
    }
        
        private func filteredTasks() -> [Task] {
            store.tasks.filter { $0.isCompleted == completionFilter && (searchText.isEmpty || $0.title.localizedCaseInsensitiveContains(searchText)) }
        }
        
        
    }
