//
//  helper.swift
//  week1
//
//  Created by Chaitanya Makkapati on 12/12/24.
//

import SwiftUI

struct colorslider: View {
    @Binding var Value: Double
    var label: String
    var body: some View {
        VStack {
            Text(label)
            HStack {
                Slider(value: $Value, in: 0...255)
                Text("\(Int(Value))")
            }
        
        }
        
    }
}
