//
//  Card.swift
//  MafiaCards
//
//  Created by user on 3/13/21.
//  Copyright © 2021 Epsillent. All rights reserved.
//

import Foundation

struct Deck: Codable {
    
    //MARK: - var
    var title: String
    
    var description: String
    
    var roles: [Role]
    
    //MARK: - public funcs
    public mutating func shuffle() {
        roles.shuffle()
    }

}
