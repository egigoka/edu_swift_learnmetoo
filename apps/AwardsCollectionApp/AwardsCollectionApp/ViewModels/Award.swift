//
//  Award.swift
//  AwardsCollectionApp
//
//  Created by egigoka2kz on 06.09.2026.
//

import SwiftUI

struct Award {
    let awardView: AnyView
    let title: String
    let awarded: Bool
    
    static func getAwards() -> [Award] {
        [
            Award(
                awardView: AnyView(GradientRectangles(width: 160, height: 160)),
                title: "Gradient Rectangles",
                awarded: true
            ),
            Award(
                awardView: AnyView(PathView(width: 160, height: 160)),
                title: "Path",
                awarded: true
            ),
            Award(
                awardView: AnyView(CurvesView(width: 160, height: 160)),
                title: "Curves",
                awarded: true
            ),
            Award(
                awardView: AnyView(SwiftBirdView(width: 160, height: 160)),
                title: "Swift Bird",
                awarded: true
            ),
            Award(
                awardView: AnyView(HypocycloidView(width: 160, height: 160)),
                title: "Hypocycloid",
                awarded: false
            ),
        ]
    }
}
