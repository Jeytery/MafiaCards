//
//  CollectionViewLabelTableViewCell.swift
//  MafiaCards
//
//  Created by Jeytery on 3/28/21.
//  Copyright © 2021 Epsillent. All rights reserved.
//

import UIKit

class CollectionViewLabelTableViewCell: UITableViewCell {

    //MARK: - vars
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var optionalButton: UIButton!
    
    public static var identifier = "CollectionViewLabelTableViewCell"
    
    public static var height: CGFloat = 200
    
    //public lazy var collectionViewDelegate = TypedCollectionViewDelegate(collectionView: collectionView)
    public var collectionViewDelegate: TypedCollectionViewDelegate?
    
    private var optionalButtonAction: (
        () -> Void
    )? = nil
        
    //MARK: - iternal functions
    @IBAction func optionButtonWasPressed(_ sender: Any) {
        optionalButtonAction?()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    //MARK: - public functions    
    public func showOptionButton(title: String, action: @escaping () -> Void) {
        optionalButtonAction = action
        optionalButton.setTitle(title, for: .normal)
        optionalButton.isHidden = false
    }
}
