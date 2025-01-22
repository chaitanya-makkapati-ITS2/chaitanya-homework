//
//  TaskListView.swift
//  week5
//
//  Created by Chaitanya Makkapati on 1/14/25.
//

import SwiftUI

struct TaskTabView: View {
    @StateObject private var store = TaskStore()
    @State private var searchText = ""
    @State private var selectedCategory: Category? = nil
    
    
    var body: some View {
        
            TabView {
                // Incomplete Tasks Tab
                
                TaskandcompletedView(label: "No tasks available", label2: "Incomplete Tasks", completionFilter:false)
                    .tabItem {
                        Label("Incomplete", systemImage: "list.bullet.circle")
                    }
                // Completed Tasks Tab
                
                TaskandcompletedView(label: "No completed tasks", label2: "Completed Tasks", completionFilter: true)
                
                    .tabItem {
                        Label("Completed", systemImage: "checkmark.circle")
                    }
                
                // Categories Tab
                
                Gridview()
                    .tabItem {
                        Label("Categories", systemImage: "square.grid.2x2")
                    }
            }
        }
    }

