//
//  week5App.swift
//  week5
//
//  Created by Chaitanya Makkapati on 1/14/25.
//

import SwiftUI

@main
struct week5App: App {
    @StateObject private var store = TaskStore()
    var body: some Scene {
        WindowGroup {
            SplashView()
                .environmentObject(store)
        }
    }
}
