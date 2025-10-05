//
//  TableImageView.swift
//  ElementsExapmplesSwiftUI
//
//  Created by egigoka on 05.10.2025.
//

import SwiftUI

struct TableImageView: View {
    var body: some View {
        Image(systemName: "table")
            .resizable()
            .frame(width: 250, height: 250)
//            .cornerRadius(250 / 2)
            .background(Color(white: 0.9))
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.red, lineWidth: 8))
            .foregroundColor(.red)
    }
}

struct FrameFromSize: ViewModifier {
    func body(content: Content) -> some View {
        <#code#>
    }
}

#Preview {
    TableImageView()
}
