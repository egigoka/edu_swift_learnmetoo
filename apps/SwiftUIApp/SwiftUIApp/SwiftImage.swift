//
//  SwiftImage.swift
//  SwiftUIApp
//
//  Created by egigoka2kz on 19.07.2026.
//

import SwiftUI

struct SwiftImage: View {
    var body: some View {
        Image("SwiftImage")
            .resizable()
            .frame(width: 150, height: 409 / 467 * 150)
    }
}

#Preview {
    SwiftImage()
}
