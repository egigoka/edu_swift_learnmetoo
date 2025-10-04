//
//  SwiftImage.swift
//  SwiftUIApp
//
//  Created by egigoka on 04.10.2025.
//

import SwiftUI

struct SwiftImage: View {
    var body: some View {
        Image("SwiftImageWhite")
            .resizable()
            .frame(width: 150, height: 150)
    }
}

#Preview {
    SwiftImage()
}
