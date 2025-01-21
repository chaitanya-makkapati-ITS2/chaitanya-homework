//
//  Commonviews.swift
//  week5
//
//  Created by Chaitanya Makkapati on 1/21/25.
//

import SwiftUI

struct textview: View {
    var label: String
    var body: some View {
        Text("\(label)")
            .font(.caption)
            .foregroundColor(.gray)
    }
}


