//
//  ColoredView.swift
//  ColoredViewSwiftUI
//
//  Created by egigoka2kz on 12.08.2026.
//

import SwiftUI

struct ColoredView: View {
    let red: Double
    let green: Double
    let blue: Double
    
    var body: some View {
        RoundedRectangle(cornerRadius: 32)
            .fill(Color(red: red/255, green: green/255, blue: blue/255))
            .stroke(.foreground, lineWidth: 4)
    }
}

#Preview {
    ColoredView(red: 100, green: 150, blue: 100)
}
