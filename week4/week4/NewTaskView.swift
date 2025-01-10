//
//  NewTaskView.swift
//  week4
//
//  Created by Chaitanya Makkapati on 1/2/25.
//

import SwiftUI

struct NewTaskView: View {
    @ObservedObject var store: TaskStore
    @Environment(\.dismiss) var dismiss
    @State private var title: String = ""
    @State private var notes: String = ""

    var body: some View {
        ScrollView {
            
            VStack(spacing: 20) {
                // Task Title Input
                VStack(alignment: .leading) {
                    Text("Task Title")
                        .font(.caption)
                        .foregroundColor(.gray)
                    TextField("Enter task title", text: $title)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                        .cornerRadius(8)
                    
                    // Notes Input
                    Text("Notes")
                        .font(.caption)
                        .foregroundColor(.gray)
                    // Minimum 5 lines height
                    TextEditor(text: $notes)
                        .frame(minHeight: 100)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                        .cornerRadius(8)
                    
                }
                
                
            }
        }
        .padding()
        .navigationTitle("Add New Task")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true) // Removes the back button
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Add") {
                    if !title.isEmpty {
                        store.addTask(title: title, notes: notes)
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
