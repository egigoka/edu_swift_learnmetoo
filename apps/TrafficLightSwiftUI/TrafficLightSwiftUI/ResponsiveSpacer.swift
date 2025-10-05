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
    ResponsiveSpacer(portraitHeight: 60, landscapeHeight: 0)
}
