//
//  ContentView.swift
//  week7
//
//  Created by Chaitanya Makkapati on 2/7/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var store = TodoStore()
    @State private var showErrorAlert = false
    
    var body: some View {
        NavigationStack {
            Group {
                if store.isLoading {
                    VStack {
                        ProgressView("Loading Data...")
                            .progressViewStyle(CircularProgressViewStyle())
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                } else {
                    List(store.todos) { todo in
                        NavigationLink(value: todo) {
                            Text(todo.title ?? "No Title")
                                .lineLimit(1)
                        }
                    }
                    .listStyle(.plain)
                }
            }
            .navigationTitle("Universities")
            .navigationDestination(for: Todo.self) { todo in
                TodoDetailView(todo: todo)
            }
            .alert("Error", isPresented: $showErrorAlert, actions: {
                Button("OK", role: .cancel) { }
            }, message: {
                if let error = store.error {
                    Text(error.localizedDescription)
                }
            })
        }
        .task {
            await store.fetchTodos()
            if store.error != nil {
                showErrorAlert = true
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
