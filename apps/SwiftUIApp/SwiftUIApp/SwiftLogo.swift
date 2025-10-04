//
//  SwiftLogo.swift
//  SwiftUIApp
//
//  Created by egigoka on 04.10.2025.
//

import SwiftUI

struct SwiftLogo: View {
    var body: some View {
        ZStack {
            ColoredCircle(color: .orange)
            SwiftImage()
        }
    }
}

#Preview {
    SwiftLogo()
}
