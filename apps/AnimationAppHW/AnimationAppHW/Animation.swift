//
//  Animation.swift
//  AnimationAppHW
//
//  Created by egigoka on 12.07.2025.
//

import SpringAnimation

struct Animation {
    let preset: String
    let curve: String
    let duration: Double
    let force: Double
    let damping: Double
    let velocity: Double
    
    var description: String {
        """
        Animation: \(preset)
        Curve: \(curve)
        Duration: \(String(format: "%.2f", duration))
        Force: \(String(format: "%.2f", force))
        Damping: \(String(format: "%.2f", damping))
        """
    }
    
    static func random() -> Animation {
        Animation(preset: AnimationPreset.allCases.randomElement()?.rawValue ?? "",
                  curve: AnimationCurve.allCases.randomElement()?.rawValue ?? "",
                  duration: Double.random(in: 0.3...2),
                  force: Double.random(in: 0.1...2),
                  damping: Double.random(in: 0.1...1),
                  velocity: Double.random(in: 0.1...2))
    }
}
