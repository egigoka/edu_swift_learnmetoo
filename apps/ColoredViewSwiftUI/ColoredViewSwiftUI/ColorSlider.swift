//
//  ColorSlider.swift
//  ColoredViewSwiftUI
//
//  Created by egigoka on 11.10.2025.
//

import SwiftUI

struct ColorSlider: View {
    var color: Color
    var value: Int
    var body: some View {
        Text("\(value)")
            .foregroundStyle(color)
        
    }
}

#Preview {
    ColorSlider(color: .red, value: 100)
}
