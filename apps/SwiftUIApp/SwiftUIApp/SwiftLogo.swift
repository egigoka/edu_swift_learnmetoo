//
//  SwiftLogo.swift
//  SwiftUIApp
//
//  Created by egigoka2kz on 19.07.2026.
//

import SwiftUI

struct SwiftLogo: View {
    var body: some View {
        ZStack {
            ColoredCircle(color: .orange)
            SwiftImage()
                .offset(x: -10, y: -10)
        }
    }
}

#Preview {
    SwiftLogo()
}
