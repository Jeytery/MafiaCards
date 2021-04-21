//
//  Manager.swift
//  MafiaCards
//
//  Created by user on 3/11/21.
//  Copyright © 2021 Epsillent. All rights reserved.
//

import UIKit
import Foundation

class Manager {
    public static var fragmentParameters = (
        card: UIFragmentParameters(
            side: .bottom,
            intend: Int(UIScreen.main.bounds.height/2),
            edges: (bottom: 20, top: 20, left: 20, right: 20),
            layer: 1,
            effect: BlackoutEffect(intensity: 0.7),
            gesture: SlideGesture(),
            cornersCurves: (corners: [.allCorners], radius: 20),
            presentType: .alert),
        card2: UIFragmentParameters(
            side: .bottom,
            intend: 50,
            edges: (bottom: 10, top: 10, left: 10, right: 10),
            layer: 1,
            effect: BlackoutEffect(intensity: 0.7),
            gesture: SlideGesture(),
            cornersCurves: (corners: [.allCorners], radius: 10),
            presentType: .topVC)
    )
}
