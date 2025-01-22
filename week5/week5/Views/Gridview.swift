//
//  Gridview.swift
//  week5
//
//  Created by Chaitanya Makkapati on 1/21/25.
//

import SwiftUI

struct Gridview: View {
    @EnvironmentObject  var store: TaskStore
    @State private var selectedCategory: Category? = nil
    var body: some View {
        NavigationStack {
            VStack {
                // Grid for Categories
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                    ForEach(Category.allCases, id: \.self) { category in
                        categoryCard(category: category)
                    }
                }
                .padding()
                
                // List of Tasks
                ScrollView {
                    ForEach(filteredTasksByCategory()) { task in
                        NavigationLink(destination: TaskDetailView(task: task, store: store)) {
                            VStack{
                                taskRow(task: task)
                                Divider()
                            }
                            .padding([.leading, .trailing], 20)
                        }
                    }
                }
            }
        }
    }
    private func filteredTasksByCategory() -> [Task] {
        guard let category = selectedCategory else { return store.tasks }
        return store.tasks.filter { $0.category == category }
    }

    private func categoryCard(category: Category) -> some View {
        VStack {
            Text(category.rawValue)
                .font(.headline)
                .foregroundColor(.white)
            Text("\(store.tasks.filter { $0.category == category }.count) tasks")
                .font(.subheadline)
                .foregroundColor(.white.opacity(0.8))
        }
        .frame(maxWidth: .infinity, minHeight: 100)
        .background(selectedCategory == category ? categoryColor(for: category): Color.gray)
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

    private func categoryColor(for category: Category) -> Color {
        switch category {
        case .work:
            return Color.blue
        case .personal:
            return Color.green
        case .home:
            return Color.orange
        case .noCategory:
            return Color.red
        }
    }
}

