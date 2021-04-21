//
//  CustomTableViewCell.swift
//  MafiaCards
//
//  Created by Jeytery on 12.04.2021.
//  Copyright © 2021 Epsillent. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    public var configureFrame: (
        (UIView) -> Void
    )? = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        configureFrame?(contentView)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
   
    }

}
