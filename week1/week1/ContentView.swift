//
//  ContentView.swift
//  week1
//
//  Created by Chaitanya Makkapati on 12/12/24.
//
import SwiftUI

/// A view that allows the user to pick a color by adjusting red, green, and blue values using sliders.
struct ContentView: View {
    
    /// The red component of the color, ranging from 0 to 255.
    @State var redvalue: Double = 0
    
    /// The green component of the color, ranging from 0 to 255.
    @State var greenvalue: Double = 0
    
    /// The blue component of the color, ranging from 0 to 255.
    @State var bluevalue: Double = 0
    
    /// The currently generated color based on the RGB values.
    @State var generatedcolor: Color = Color.gray
    
    /// The main body of the view.
    var body: some View {
        GeometryReader { geometry in
            
            if geometry.size.width < geometry.size.height {
                VStack {
                    Text("Color Picker")
                        .font(.largeTitle)
                    
                    // Display the generated color
                    RoundedRectangle(cornerRadius: 0)
                        .fill(Color(red: redvalue/255, green: greenvalue/255, blue: bluevalue/255))
                        .padding()
                    Colorslider(Value: $redvalue , label: "Red")
                    Colorslider(Value: $greenvalue, label: "Green")
                    Colorslider(Value: $bluevalue, label: "Blue")
                    
                }.padding()
            }
            
            else {
                VStack {
                    Text("Color Picker")
                        .font(.largeTitle)
                    
                    // Display the generated color
                    RoundedRectangle(cornerRadius: 0)
                        .fill(Color(red: redvalue/255, green: greenvalue/255, blue: bluevalue/255))
                        .padding()
                    HStack{
                        Colorslider(Value: $redvalue , label: "Red")
                        Colorslider(Value: $greenvalue, label: "Green")
                        Colorslider(Value: $bluevalue, label: "Blue")
                        //Button("Set Color") {
                        //    generatedcolor = Color(red: redvalue/255, green: greenvalue/255, blue: bluevalue/255)
                       // }
                    }
                }.padding()
                
                // Sliders for adjusting the RGB values
                
                
                // Button to set the color based on slider values
                
            }
            
            
            //
        }
        
    }
}

#Preview {
    ContentView()
}


