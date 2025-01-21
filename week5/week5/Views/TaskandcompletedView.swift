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
   @Binding var completionFilter: Bool
    
    
    var body: some View {
        NavigationStack {
            VStack {
                if filteredTasks(isCompleted: completionFilter).isEmpty {
                    
                    Text("\(label)")
                        .font(.headline)
                        .foregroundColor(.gray)
                        .padding()
                } else {
                    List {
                        ForEach(filteredTasks(isCompleted: completionFilter)) { task in
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
            .navigationTitle("\(label2)")
            .searchable(text: $searchText)
            
        }
    }
        
        private func filteredTasks(isCompleted: Bool) -> [Task] {
            
            store.tasks.filter { $0.isCompleted == isCompleted && (searchText.isEmpty || $0.title.localizedCaseInsensitiveContains(searchText)) }
        }
        
        
    }
