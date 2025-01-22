//
//  Splashview.swift
//  week5
//
//  Created by Chaitanya Makkapati on 1/20/25.
//

import SwiftUI

struct SplashView: View {
    @State private var isActive = false
    @State private var logoSize: CGFloat = 0.5
    @State private var opacity = 0.0
    
    var body: some View {
        if isActive {
            ContentView()
        } else {
            ZStack {
                Color.blue.edgesIgnoringSafeArea(.all)
                VStack {
                    Image(systemName: "bolt.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .foregroundColor(.white)
                        .scaleEffect(logoSize)
                        .opacity(opacity)
                        .onAppear {
                            withAnimation(.easeIn(duration: 1.5)){
                                self.logoSize = 1.0
                                self.opacity = 1.0
                            }
                        }
                    Text("Welcome To my todo App")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .padding(.top, 20)
                        
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                    withAnimation{
                        self.isActive = true
                    }
                }
            }

        }
    }
}
