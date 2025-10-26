//
//  View + endTextEditing.swift
//  StateAndDataFlowApp
//
//  Created by egigoka on 26.10.2025.
//

import SwiftUI

extension View {
    func hideKeyboardWhenTapped() -> some View  {
        self
            .contentShape(Rectangle())
            .onTapGesture {
            UIApplication.shared.sendAction(
                #selector(UIResponder.resignFirstResponder),
                to: nil, from: nil, for: nil)
        }
    }
}
