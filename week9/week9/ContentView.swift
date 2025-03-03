//
//  ContentView.swift
//  week9
//
//  Created by Chaitanya Makkapati on 2/27/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = CatFactViewModel()
    @State private var factCount = "" //  number of facts
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    TextField("Number of facts", text: $factCount)
                        .keyboardType(.numberPad)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)
                    
                    Button("Fetch Facts") {
                        if let count = Int(factCount) {
                            Task {
                                await viewModel.fetchFacts(count: count)
                            }
                        }
                    }
                    .padding(.horizontal)
                }
                .padding(.top)
                
                List(viewModel.catFacts) { fact in
                    Text(fact.fact)
                        .padding(.vertical, 4)
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("Cat Facts")
        }
    }
}

#Preview {
    ContentView()
}
