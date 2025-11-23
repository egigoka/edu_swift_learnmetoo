//
//  SwiftView.swift
//  AwardsCollectionApp
//
//  Created by egigoka on 23.11.2025.
//

import SwiftUI

struct SwiftView: View {
    let width: CGFloat
    let height: CGFloat
    @State var point: CounterModel
    
    var body: some View {
        ZStack {
            Image("swiftimage256x256")
            Path { path in
                path.move(to: point(x: 207, y: 13))
                path.addQuadCurve(to: point(x: 293, y: 213), control: point(x: 325, y: 110))
                path.addQuadCurve(to: point(x: 315, y: 286), control: point(x: 325, y: 245))
                path.addQuadCurve(to: point(x: 250, y: 267), control: point(x: 275, y: 248))
                path.addQuadCurve(to: point(x: 12, y: 193), control: point(x: 135, y: 335))
                path.addQuadCurve(to: point(x: 182, y: 212), control: point(x: 110, y:250))
                path.addQuadCurve(to: point(x: 40, y: 55), control: point(x: 90, y: 130))
                path.addQuadCurve(to: point(x: 158, y: 146), control: point(x: 50, y: 70))
                path.addQuadCurve(to: point(x: 76, y: 39), control: point(x: 115, y: 100))
                path.addQuadCurve(to: point(x: 226, y: 160), control: point(x: 180, y: 130))
                path.addQuadCurve(to: point(x: 207, y: 13), control: point(x: 260, y: 100))
            }
            .stroke(.black, lineWidth: 2)
        }
        .frame(width: width, height: height)
    }
    
    private func point(x: CGFloat, y: CGFloat) -> CGPoint {
        print(point)
        if await point.getValue() % 2 == 0 {
           // print("path.addQuadCurve(to: CGPoint(x: \(x * width / 256), y: \(y * height / 256))", terminator: "")
        } else {
            print(", control: CGPoint(x: \(x * width / 256), y: \(y * height / 256))")
        }
        Task {
            await point.increment()
        }
        return CGPoint(x: x * width / 256 , y: y * height / 256)
    }
}

actor CounterModel {
    private(set) var value: Int = 0

    func increment() {
        value += 1
    }

    func getValue() -> Int {
        value
    }
}

#Preview {
    SwiftView(width: 200, height: 200, point: CounterModel())
}
