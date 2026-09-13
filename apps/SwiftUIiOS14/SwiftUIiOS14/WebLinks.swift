//
//  WebLinks.swift
//  SwiftUIiOS14
//
//  Created by egigoka2kz on 13.09.2026.
//

import SwiftUI

struct WebLinks: View {
    var body: some View {
        Link("Learn Swift", destination: URL(string: "https://swiftbook.ru")!)
            .font(.title)
            .foregroundStyle(.red)
        Link(destination: URL(string: "https://swiftbook.ru")!) {
            Image(systemName: "link.circle.fill")
                .font(.largeTitle)
        }
    }
}

#Preview {
    WebLinks()
}
