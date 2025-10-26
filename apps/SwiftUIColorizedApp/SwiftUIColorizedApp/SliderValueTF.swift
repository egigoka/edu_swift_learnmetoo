//
//  SliderValueTF.swift
//  SwiftUIColorizedApp
//
//  Created by Alexey Efimov on 21.10.2020.
//  Copyright © 2020 Alexey Efimov. All rights reserved.
//

import SwiftUI

struct SliderValueTF: View {
    @Binding var textValue: String
    @Binding var value: Double
    
    @State private var showAlert: Bool = false
    
    var body: some View {
        
        TextField("", text: $textValue, onCommit: checkValue)
            .frame(width: 55, alignment: .trailing)
            .multilineTextAlignment(.trailing)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("Wrong Format"),
                    message: Text("Please enter value from 0 to 255")
                )
            }
    }
}

extension SliderValueTF {
    private func checkValue() {
        if let value = Int(textValue), (0...255).contains(value) {
            self.value = Double(value)
        } else {
            showAlert = true
            value = 0
            textValue = "0"
        }
    }
}

struct SliderValueTF_Previews: PreviewProvider {
    static var previews: some View {
        SliderValueTF(textValue: .constant("128"), value: .constant(128.0))
    }
}
