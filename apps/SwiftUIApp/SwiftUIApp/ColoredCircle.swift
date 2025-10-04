//
//  ColoredCircle.swift
//  SwiftUIApp
//
//  Created by egigoka on 04.10.2025.
//

import SwiftUI

struct ColoredCircle: View {
    let color: UIColor
    var body: some View {
        Color(color)
            //.ignoresSafeArea()
            //.edgesIgnoringSafeArea(.all) // can set different egde to ignore
            .frame(width: 250, height: 250)
            .clipShape(Circle())
            .shadow(radius: 10)
            .overlay(Circle().stroke(.white, lineWidth: 4))
    }
}

#Preview {
    ColoredCircle(color: .orange)
}
