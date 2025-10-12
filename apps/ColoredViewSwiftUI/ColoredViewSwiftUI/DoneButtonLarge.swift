//
//  DoneButtonLarge.swift
//  ColoredViewSwiftUI
//
//  Created by egigoka on 12.10.2025.
//

import SwiftUI

struct DoneButtonLarge: View {
    @FocusState var isFocused: Bool
    var body: some View {
        Button {
            isFocused = false
        } label: {
            Image(systemName: "checkmark")
            .font(.system(size: UIFont.preferredFont(forTextStyle: .title2).pointSize * 1.2))
        }
        .buttonBorderShape(.circle)
        .buttonStyle(.glassProminent)
        .labelStyle(.iconOnly)
        .opacity(isFocused ? 1 : 0)
        .frame(height: isFocused ? nil : 0)
    }
}

#Preview {
    @Previewable @FocusState var isFocused: Bool
    
    DoneButtonLarge(
        isFocused: FocusState<Bool>()
    )
    .onAppear {
        isFocused = true
    }
}
