//
//  RolesTableViewCell.swift
//  MafiaCards
//
//  Created by user on 3/15/21.
//  Copyright © 2021 Epsillent. All rights reserved.
//

import UIKit

class RolesTableViewCell: UITableViewCell {
    
    //MARK: - var
    @IBOutlet weak var rolesCollectionView: UICollectionView!
    
    public static var identifier = "RolesTableViewCell"
    
    public lazy var collectionViewDelegate = RolesCollectionViewDelegate(
        collectionView: rolesCollectionView
    )
    
    //MARK: - iternal funcs
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    //MARK: - public funcs
    public func setRoles(roles: [Role]) {
        collectionViewDelegate.update(roles: roles)
    }

}
