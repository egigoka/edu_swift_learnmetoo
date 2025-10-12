//
//  TextLabel + textWidth.swift
//  ColoredViewSwiftUI
//
//  Created by egigoka on 12.10.2025.
//

import SwiftUI

extension View {
    func fixedDigitWidth(_ digitCount: Int, padding: CGFloat = 0) -> some View {
        self.modifier(FixedDigitWidthModifier(digitCount: digitCount, padding: padding))
    }
}

struct FixedDigitWidthModifier: ViewModifier {
    let digitCount: Int
    let padding: CGFloat
    @State private var width: CGFloat = 0
    
    func body(content: Content) -> some View {
        content
            .monospacedDigit()
            .frame(width: width)
            .background(
                GeometryReader { geo in
                    Text(String(repeating: "0", count: digitCount))
                        .monospacedDigit()
                        .fixedSize()
                        .opacity(0)
                        .onAppear {
                            // Force immediate measurement
                            DispatchQueue.main.async {
                                width = geo.size.width
                            }
                        }
                        .background(
                            GeometryReader { textGeo in
                                Color.clear.onAppear {
                                    width = textGeo.size.width + padding
                                }
                            }
                        )
                }
            )
    }
}

struct TextLabelStaticTextWidth: View {
    @State var text: String = "888"
    var body: some View {
        TextField("", text: $text)
            .fixedDigitWidth(3)
            .background(Color.red)
    }
}

#Preview {
    TextLabelStaticTextWidth()
}
