//
//  RoleCollectionViewCell.swift
//  MafiaCards
//
//  Created by user on 3/16/21.
//  Copyright © 2021 Epsillent. All rights reserved.
//

import UIKit

class RoleCollectionViewCell: UICollectionViewCell {

    //MARK: - var
    @IBOutlet weak var mainView: UIView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    public static var identifier = "RoleCollectionViewCell"
    
    //MARK: - iternal funcs
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    //MARK: - public funcs
    public func setRole(role: Role) {
        titleLabel.text = role.title
    }
    
}
