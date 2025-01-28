//
//  APIDetailView.swift
//  week6
//
//  Created by Chaitanya Makkapati on 1/27/25.
//

import SwiftUI
import WebKit

struct APIDetailView: View {
    let entry: APIEntry

    var body: some View {
        VStack {
            if let url = URL(string: entry.link) {
                WebView(url: url) // Embed the WebView
            } else {
                Text("Invalid URL")
                    .foregroundColor(.red)
            }
        }
        .navigationTitle(entry.api) // Display the API name as the title
        .navigationBarTitleDisplayMode(.inline)
    }
}

