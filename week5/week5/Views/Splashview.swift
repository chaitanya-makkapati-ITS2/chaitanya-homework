//
//  Splashview.swift
//  week5
//
//  Created by Chaitanya Makkapati on 1/20/25.
//

import SwiftUI

struct SplashView: View {
    @State private var isActive = false

    var body: some View {
        if isActive {
            ContentView()
        } else {
            VStack {
                ProgressView() 
                    .scaleEffect(3.0)
                    .progressViewStyle(CircularProgressViewStyle())
                    .padding()
                Text("Loading...")
                    .font(.headline)
                    .foregroundColor(.gray)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.white)
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    withAnimation {
                        isActive = true
                    }
                }
            }
        }
    }
}
