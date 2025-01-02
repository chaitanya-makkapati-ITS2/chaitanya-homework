//
//  slider-view.swift
//  
//
//  Created by Chaitanya Makkapati on 12/27/24.
//



/// A reusable slider view for adjusting a color component value.
///
/// - Parameters:
///   - Value: A binding to a `Double` value representing the slider's current value (0-255).
///   - label: A `String` that specifies the label for the slider.
struct Colorslider: View {
    
    /// The value of the slider, bound to an external state variable.
    @Binding var Value: Double
    
    /// The label describing the color component (e.g., "Red", "Green", "Blue").
    var label: String
    
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

