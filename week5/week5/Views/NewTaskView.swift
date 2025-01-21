//
//  NewTaskView.swift
//  week5
//
//  Created by Chaitanya Makkapati on 1/14/25.
//

import SwiftUI

struct NewTaskView: View {
    @ObservedObject var store: TaskStore
    @Environment(\.dismiss) var dismiss
    @State private var title: String = ""
    @State private var notes: String = ""
    @State private var selectedCategory: TaskCategory = .uncategorized // Default category
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                textview(label: "Task Title")
                TextField("Enter a task title", text: $title)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(8)
                textview( label: "Notes")
                TextEditor(text: $notes)
                    .frame(minHeight: 100)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(8)
                textview(label: "Category")
                Picker("Select Category", selection: $selectedCategory) {
                    ForEach(TaskCategory.allCases, id: \.self) { category in
                        Text(category.rawValue).tag(category)
                    }
                }
                .pickerStyle(MenuPickerStyle())
                .padding()
                .background(Color(.secondarySystemBackground))
                .cornerRadius(8)
            }
        }
        .padding()
        .navigationTitle("Add New Task")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Add") {
                    if !title.isEmpty {
                        store.addTask(title: title, notes: notes, category: selectedCategory)
                        dismiss()
                    }
                }
                .disabled(title.isEmpty)
            }
            ToolbarItem(placement: .navigationBarLeading) {
                Button("Cancel") {
                    dismiss()
                }
            }
        }
    }
}
