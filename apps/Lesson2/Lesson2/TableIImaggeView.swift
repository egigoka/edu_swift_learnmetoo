//
//  TableIImaggeView.swift
//  Lesson2
//
//  Created by egigoka2kz on 12.08.2026.
//

import SwiftUI

struct TableIImaggeView: View {
    let size = CGSize(width: 250, height: 250)
    
    var body: some View {
        Image(systemName: "table")
            .resizable()
            .frame(size)
            .background(Color(white:0.9))
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.red, lineWidth: 8))
            .foregroundStyle(.red)
    }
}

extension Image {
    func frame(_ size: CGSize) -> some View {
        modifier(FrameFromSize(size: size))
    }
}

struct FrameFromSize: ViewModifier {
    let size: CGSize
    
    func body(content: Content) -> some View {
        content.frame(width: size.width, height: size.height)
    }
}

#Preview {
    TableIImaggeView()
}
