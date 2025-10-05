//
//  ResponsiveSpacer.swift
//  TrafficLightSwiftUI
//
//  Created by egigoka on 05.10.2025.
//

import SwiftUI

struct ResponsiveSpacer: View {
    
    @Environment(\.verticalSizeClass) var verticalSizeClass
    
    let portraitHeight: CGFloat
    let landscapeHeight: CGFloat
    
    var body: some View {
        Spacer()
            .frame(
                height: verticalSizeClass == .compact
                ? landscapeHeight
                : portraitHeight
            )
    }
}

#Preview {
    VStack {
        Rectangle()
            .frame(height: 1)
            .foregroundStyle(.clear)
            .overlay(
                Rectangle()
                    .stroke(.red, style: StrokeStyle(lineWidth: 1, dash: [4]))
            )
        ResponsiveSpacer(portraitHeight: 60, landscapeHeight: 0)
            .overlay(
                Rectangle()
                    .stroke(.red, style: StrokeStyle(lineWidth: 1, dash: [5]))
            )
        Rectangle()
            .frame(height: 1)
            .foregroundStyle(.clear)
            .overlay(
                Rectangle()
                    .stroke(.red, style: StrokeStyle(lineWidth: 1, dash: [4]))
            )
    }
    .frame(height: 100)
}
