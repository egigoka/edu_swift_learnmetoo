//
//  GameSlider.swift
//  SliderGame
//
//  Created by egigoka on 08.11.2025.
//

import SwiftUI

struct GameSlider: View {
    @Binding var currentValue: Double
    
    let targetValue: Int
    let color: UIColor
    let alpha: Int
    
    var body: some View {
        VStack(spacing: 24) {
            Text("Get as close to the value: \(targetValue)")
            HStack {
                Text("0")
                UISliderView(value: $currentValue, alpha: alpha, color: .red)
                Text("100")
            }
        }
    }
}

#Preview {
    @Previewable @State var currentValue: Double = 50
    GameSlider(currentValue: $currentValue,
               targetValue: 50,
               color: .red,
               alpha: 100)
}
