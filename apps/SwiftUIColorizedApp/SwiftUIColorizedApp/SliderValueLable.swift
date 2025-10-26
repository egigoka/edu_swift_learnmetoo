//
//  SliderValueLable.swift
//  SwiftUIColorizedApp
//
//  Created by Alexey Efimov on 21.10.2020.
//  Copyright © 2020 Alexey Efimov. All rights reserved.
//

import SwiftUI

struct SliderValueLabel: View {
    
    let value: Double
    
    var body: some View {
        Text("\(lround(value))")
            .frame(width: 35, alignment: .leading)
            .foregroundColor(.white)
    }
}

struct SliderValueLable_Previews: PreviewProvider {
    static var previews: some View {
        SliderValueLabel(value: 128)
    }
}
