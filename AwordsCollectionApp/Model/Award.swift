//
//  Award.swift
//  AwordsCollectionApp
//
//  Created by Alexey Efimov on 04.11.2020.
//  Copyright © 2020 Alexey Efimov. All rights reserved.
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
                title: "My First Award",
                awarded: true
            ),
            Award(
                awardView: AnyView(PathView(width: 160, height: 160)),
                title: "My Second Award",
                awarded: true
            ),
            Award(
                awardView: AnyView(CurvesView(width: 160, height: 160)),
                title: "My Third Award",
                awarded: true
            ),
            Award(
                awardView: AnyView(HypocycloidView(width: 160, height: 160, showSliders: false)),
                title: "My Fours Award",
                awarded: false
            )
        ]
    }
}
