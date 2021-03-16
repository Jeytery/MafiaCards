//
//  DeckCollectionViewCell.swift
//  MafiaCards
//
//  Created by user on 3/13/21.
//  Copyright © 2021 Epsillent. All rights reserved.
//

import UIKit

class DeckCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var mainView: UIView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    public static let identifier = "DeckCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    public func setUp(
        title: String,
        color: String)
    {
        titleLabel.text = title
    }
    
}
