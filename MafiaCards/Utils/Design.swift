//
//  Design.swift
//  MafiaCards
//
//  Created by user on 3/11/21.
//  Copyright © 2021 Epsillent. All rights reserved.
//

import Foundation
import UIKit

class Design {
    
    public static let calmOrange = UIColor(red: 255/255, green: 98/255, blue: 31/255, alpha: 1)
    
    public static let calmBlue = UIColor(red: 31/255, green: 162/255, blue: 255/255, alpha: 1)
    
    public static func setGreyStyle(button: inout UIButton) {
        button.backgroundColor = UIColor(
            red: 227/255,
            green: 227/255,
            blue: 227/255,
            alpha: 1
        )
        button.layer.cornerRadius = 10
    }

}
