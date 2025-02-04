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
            if let link = entry.link, let url = URL(string: link) {
                WebView(url: url)
            } else {
                Text("Invalid or missing URL")
                    .foregroundColor(.red)
            }
        }
        .navigationTitle(entry.api ?? "API Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}
