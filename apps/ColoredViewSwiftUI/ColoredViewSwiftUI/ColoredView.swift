//
//  ColoredView.swift
//  ColoredViewSwiftUI
//
//  Created by egigoka on 11.10.2025.
//

import SwiftUI

struct ColoredView: View {
    let red: Double
    let green: Double
    let blue: Double
    
    var body: some View {
        let cornerRadius: CGFloat = 16
        RoundedRectangle(cornerRadius: cornerRadius)
            .fill(Color(red: red/255, green: green/255, blue: blue/255))
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(lineWidth: 4)
            )
    }
}

#Preview {
    ColoredView(red: 100, green: 200, blue: 150)
}
