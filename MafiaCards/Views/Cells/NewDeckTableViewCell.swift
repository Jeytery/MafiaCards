//
//  NewDeckTableViewCell.swift
//  MafiaCards
//
//  Created by user on 3/11/21.
//  Copyright © 2021 Epsillent. All rights reserved.
//

import UIKit

class NewDeckTableViewCell: UITableViewCell {

    @IBOutlet weak var addNewDescLabel: UILabel!
    
    @IBOutlet weak var addNewButton: UIButton!
    
    public static let identifier = "NewDeckCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        Design.setGreyStyle(button: &addNewButton)
        addNewButton.setTitle(localize(id: NEW_DECK_BUTTON_TITLE), for: .normal)
        addNewDescLabel.text = localize(id: NEW_DECK_LABEL)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}
