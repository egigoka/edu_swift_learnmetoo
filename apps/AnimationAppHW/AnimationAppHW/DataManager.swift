//
//  DataManager.swift
//  AnimationAppHW
//
//  Created by egigoka on 12.07.2025.
//

import SpringAnimation

class DataManager {
    static let shared = DataManager()
    
    private init() { }
    
    let animations = AnimationPreset.allCases
    let curves = AnimationCurve.allCases
}
