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
        Rectangle()
            .fill(Color(red: red/255.0, green: green/255.0, blue: blue/255.0))
            .scaledToFill()
            .round
    }
}

#Preview {
    ColoredView(red: 100, green: 200, blue: 150)
}
