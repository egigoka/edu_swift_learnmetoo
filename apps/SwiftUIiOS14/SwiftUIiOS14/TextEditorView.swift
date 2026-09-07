//
//  TextEditorView.swift
//  SwiftUIiOS14
//
//  Created by egigoka2kz on 07.09.2026.
//

import SwiftUI

struct TextEditorView: View {
    @State private var userBio = "Enter your bio"
    
    var body: some View {
        NavigationView {
            TextEditor(text: $userBio)
                .font(.title)
                .foregroundStyle(.red)
        }
    }
}

#Preview {
    TextEditorView()
}
