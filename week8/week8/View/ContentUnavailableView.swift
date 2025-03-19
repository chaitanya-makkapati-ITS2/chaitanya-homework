//
//  ContentUnavailableView.swift
//  week8
//
//  Created by Chaitanya Makkapati on 2/24/25.
//

import SwiftUI

struct ContentUnavailableView: View {
    let message: String

    var body: some View {
        VStack(spacing: 16) {
            Image(systemName: "exclamationmark.triangle.fill")
                .resizable()
                .frame(width: 60, height: 60)
                .foregroundColor(.gray)
            Text(message)
                .font(.headline)
                .foregroundColor(.gray)
        }
        .padding()
    }
}
