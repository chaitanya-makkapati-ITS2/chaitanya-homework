//
//  helper.swift
//  week1
//
//  Created by Chaitanya Makkapati on 12/12/24.
//

import SwiftUI

/// A reusable slider view for adjusting a color component value.
///
/// This custom view is designed to be used in `ContentView` to adjust
/// the red, green, or blue components of a color.
///
/// - Parameters:
///   - Value: A binding to a `Double` value representing the slider's current value (0-255).
///   - label: A `String` that specifies the label for the slider.
struct colorslider: View {
    
    /// The value of the slider, bound to an external state variable.
    @Binding var Value: Double
    
    /// The label describing the color component (e.g., "Red", "Green", "Blue").
    var label: String
    
    /// The body of the slider view.
    var body: some View {
        HStack {
            // Label
            Text("\(label):")
            
            // Slider
            Slider(value: $Value, in: 0...255, step: 1)
                .accentColor(labelColor(label))
            
            // Display the current value
            Text("\(Int(Value))")
        }
        .padding()
    }
    
    /// Determines the slider accent color based on the label.
    ///
    /// - Parameter label: A `String` representing the color component label.
    /// - Returns: A `Color` corresponding to the label.
    private func labelColor(_ label: String) -> Color {
        switch label.lowercased() {
        case "red":
            return .red
        case "green":
            return .green
        case "blue":
            return .blue
        default:
            return .gray
        }
    }
}
