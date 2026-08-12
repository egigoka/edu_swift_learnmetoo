//
//  ColoredView.swift
//  ColoredViewSwiftUI
//
//  Created by egigoka2kz on 12.08.2026.
//

import SwiftUI

struct ColoredView: View {
    let color: Color
    
    var body: some View {
        RoundedRectangle(cornerRadius: 32)
            .fill(color)
            .stroke(.foreground, lineWidth: 4)
    }
}

#Preview {
    ColoredView(color: .red)
}
