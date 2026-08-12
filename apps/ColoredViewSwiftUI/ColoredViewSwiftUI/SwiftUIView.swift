//
//  SwiftUIView.swift
//  ColoredViewSwiftUI
//
//  Created by egigoka2kz on 12.08.2026.
//

import SwiftUI

struct SwiftUIView: View {
    
    @State var color: Color
    @Binding var value: Int
    
    var body: some View {
        Text("\(value)")
        Slider(
            value: Binding(
                get: { Double(value) },
                set: { value = Int($0) }
            ),
            in: 0...255,
            step: 1
        )
    }
}

#Preview {
    SwiftUIView(color: .red, value: .constant(100))
}
