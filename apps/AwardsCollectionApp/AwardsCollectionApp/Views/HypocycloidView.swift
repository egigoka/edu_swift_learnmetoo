//
//  HypocycloidView.swift
//  Lesson 6
//
//  Created by Alexey Efimov on 24.06.2020.
//  Copyright © 2020 Alexey Efimov. All rights reserved.
//

import SwiftUI


struct HypocycloidView: View {
    @State private var bigR = 4.176737
    @State private var smalR = 1.76
    
    let width: CGFloat
    let height: CGFloat
    
    private let p = 1.0
    private let color: Color = .red
    
    var body: some View {
        VStack {
            GeometryReader { geometry in
                Path { path in
                    let size = min(geometry.size.width, geometry.size.height)
                    let ratio = Double(size) / ((bigR - smalR) + smalR * p) / 2.0
                    
                    var angle = 0
                    let maxT = 2880
                    var curveClosed = false
                    
                    var x0: Double = 0
                    var y0: Double = 0
                    
                    while(angle < maxT && !curveClosed) {
                        let theta = Angle.init(degrees: Double(angle)).radians
                        let component = ((bigR + smalR) / smalR) * theta
                        let x = (bigR - smalR) * cos(theta) + smalR * p * cos(component)
                        let y = (bigR - smalR) * sin(theta) - smalR * p * sin(component)
                        
                        let xc = x * ratio
                        let yc = y * ratio
                        if angle == 0 {
                            x0 = xc
                            y0 = yc
                            path.move(to: CGPoint(x: x0, y: y0))
                        } else {
                            path.addLine(to: CGPoint(x: xc, y: yc))
                            if abs(xc - x0) < 0.25 && abs(yc - y0) < 0.25 {
                                curveClosed = true
                            }
                        }
                        angle = angle + 1
                    }
                }
                .offset(x: geometry.size.width / 2.0, y: geometry.size.height / 2.0)
                .stroke(color, lineWidth: 2)
            }
            .frame(width: width, height: height)
            
//            Slider(value: $bigR, in: 1...10)
//            Slider(value: $smalR, in: 1...10)
        }
        .padding()
    }
}

struct HypocycloidView_Previews: PreviewProvider {
    static var previews: some View {
        HypocycloidView(width: 200, height: 200)
    }
}
