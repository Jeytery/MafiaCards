//
//  CardsTableViewCell.swift
//  MafiaCards
//
//  Created by user on 3/12/21.
//  Copyright © 2021 Epsillent. All rights reserved.
//

import UIKit

class DecksTableViewCell: UITableViewCell {
    
    @IBOutlet weak var decksCollectionView: UICollectionView!
    
    public static let identifier = "CardsTableViewCell"
    
    private lazy var collectionViewDelegate = DecksCollectionViewDelegate(
        collectionView: decksCollectionView
    )
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //MARK: - public funcs
    public func setDecks(decks: [Deck]) {
        guard decksCollectionView != nil else { return }
        collectionViewDelegate.update(decks: decks)
    }
}
