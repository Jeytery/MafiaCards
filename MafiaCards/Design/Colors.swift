//
//  Colors.swift
//  MafiaCards
//
//  Created by Jeytery on 12.04.2021.
//  Copyright © 2021 Epsillent. All rights reserved.
//

import UIKit

fileprivate var colors = [String: UIColor]()

class Colors {
    
    public static let lightGray = UIColor(red: 244/255, green: 244/255, blue: 244/255, alpha: 1)
    
    public static func convertStringToColor(
        colorsName: String) -> UIColor
    {
        return colors[colorsName] ?? .systemRed
    }
    
    public static func configure() {
        colors["Black"] = .black
        colors["Red"] = .systemRed
        colors["Green"] = .systemGreen
    }
    
    public static func getAllColors() -> [UIColor] {
        var data = [UIColor]()
        for (_, color) in colors {
            data.append(color)
        }
        return data
    }
    
}

