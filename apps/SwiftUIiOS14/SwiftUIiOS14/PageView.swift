//
//  PageView.swift
//  SwiftUIiOS14
//
//  Created by egigoka2kz on 07.09.2026.
//

import SwiftUI

struct PageView: View {
    var body: some View {
        TabView {
            Text("This is")
            Text("Page View")
            Text("In SwiftUI")
        }
        .font(.largeTitle)
        .foregroundStyle(.red)
        .tabViewStyle(.page)
    }
}

#Preview {
    PageView()
}
