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
    
    public static let calmBlue   = UIColor(red: 31/255, green: 162/255, blue: 255/255, alpha: 1)
    
    public static let lightGrey  = UIColor(red: 242/255, green: 242/255, blue: 242/255, alpha: 1)
    
    public static func setGreyStyle(button: inout UIButton) {
        button.backgroundColor = UIColor(
            red: 227/255,
            green: 227/255,
            blue: 227/255,
            alpha: 1
        )
        button.layer.cornerRadius = 10
    }
    
    public static func setGreyStyle(textField: inout UITextField) {
        let lightGrey = Design.lightGrey
        textField.layer.masksToBounds = true
        textField.backgroundColor = lightGrey
        textField.borderStyle = .roundedRect
        textField.layer.cornerRadius = 13
        textField.clearButtonMode = .whileEditing
        textField.layer.borderWidth = 1
        textField.layer.borderColor = Design.lightGrey.cgColor
    }

}
