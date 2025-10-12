//
//  TextLabel + textWidth.swift
//  ColoredViewSwiftUI
//
//  Created by egigoka on 12.10.2025.
//

import SwiftUI
import UIKit

extension View {
    func textWidth(for count: Int) -> CGFloat {
        let fontSize = UIFont.preferredFont(forTextStyle: .body).pointSize
        let sample = String(repeating: "8", count: count)
        let font = UIFont.monospacedDigitSystemFont(ofSize: fontSize, weight: .regular)
        let attributes: [NSAttributedString.Key: Any] = [.font: font]
        let size = sample.size(withAttributes: attributes)
        print(size.width)
        print(fontSize)
        return size.width + 16 // inner padding compensation
    }
    
    func _textWidth(for count: Int) -> CGFloat {
        let baseFont = UIFont.preferredFont(forTextStyle: .body)
        let metrics = UIFontMetrics(forTextStyle: .body)
        let scaledFont = metrics.scaledFont(for: baseFont)
        let monospaced = UIFont.monospacedDigitSystemFont(ofSize: scaledFont.pointSize, weight: .regular)
        let sample = String(repeating: "8", count: count)
                let size = (sample as NSString).size(withAttributes: [.font: monospaced])
        return ceil(size.width + scaledFont.pointSize * 0.9)
        
    }
    
    func __textWidth(for count: Int) -> CGFloat {
        
        let width = Font.Width(13)
        
        return width
    }
}


struct TextLabelStaticTextWidth: View {
    @State var text: String = "888"
    var body: some View {
        Text(text)
            .frame(width: self.textWidth(for: 3))
        TextField("TextField", text: $text)
            .frame(width: self.textWidth(for: 3))
        let width = Double(self.textWidth(for: 3))
        let width2 = Double(self._textWidth(for: 3))
        let width3 = Double(self.__textWidth(for: 3))
        Text(String(width))
        Text(String(width2))
        Text(String(width3))
    }
}

#Preview {
    TextLabelStaticTextWidth()
}
