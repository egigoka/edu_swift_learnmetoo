//
//  ColoredCircle.swift
//  SwiftUIApp
//
//  Created by egigoka2kz on 19.07.2026.
//

import SwiftUI

struct ColoredCircle: View {
    
    let color: UIColor
    
    var body: some View {
        Color(color)
            .frame(width: 250, height: 250)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
            .shadow(radius: 10)
    }
}

#Preview {
    ColoredCircle(color: .red)
}
