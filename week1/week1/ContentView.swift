//
//  ContentView.swift
//  week1
//
//  Created by Chaitanya Makkapati on 12/12/24.
//
import SwiftUI

struct ContentView: View {
    @State var redvalue: Double = 0
    @State var greenvalue: Double = 0
    @State var bluevalue: Double = 0
    @State var generatedcolor: Color = Color.gray
    var body: some View {
        VStack {
            
            Text("Color Picker")
                .font(.largeTitle)
            RoundedRectangle(cornerRadius: 0)
                .fill(generatedcolor)
                .padding()
            
            colorslider(Value: $redvalue , label: "Red")
            colorslider(Value: $greenvalue, label: "Green")
            colorslider(Value: $bluevalue, label: "Blue")
            
            Button("Set Color") {
                generatedcolor = Color(red: redvalue/255, green: greenvalue/255, blue: bluevalue/255)
            }
            
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}


