//
//  TodoDetailView.swift
//  week7
//
//  Created by Chaitanya Makkapati on 2/7/25.
//

import SwiftUI

struct TodoDetailView: View {
    let todo: Todo
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Group {
                    Text("**Title:** \(todo.title ?? "N/A")")
                    Text("**User ID:** \(todo.userId.map(String.init) ?? "N/A")")
                    Text("**ID:** \(todo.id.map(String.init) ?? "N/A")")
                    Text("**Completed:** \(todo.completed.map { $0 ? "Yes" : "No" } ?? "N/A")")
                }
                .font(.body)
                
                Divider()
                
                // Download an image from a remote URL.
                AsyncImage(url: URL(string: "https://picsum.photos/400/300")) { phase in
                    switch phase {
                    case .empty:
                        VStack {
                            ProgressView()
                            Text("Downloading Image...")
                                .font(.caption)
                        }
                        .frame(maxWidth: .infinity, minHeight: 200)
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    case .failure:
                        Image(systemName: "photo")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(.gray)
                            .frame(maxWidth: .infinity, minHeight: 200)
                    @unknown default:
                        EmptyView()
                    }
                }
                
                Spacer()
            }
            .padding()
        }
        .navigationTitle(todo.title ?? "Details")
    }
}

struct TodoDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TodoDetailView(todo: Todo(userId: 1, id: 1, title: "Test Todo", completed: false))
    }
}
