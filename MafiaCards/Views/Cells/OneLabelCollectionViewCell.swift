//
//  OneLabelCollectionViewCell.swift
//  MafiaCards
//
//  Created by Jeytery on 12.04.2021.
//  Copyright © 2021 Epsillent. All rights reserved.
//

import UIKit

class OneLabelCollectionViewCell: UICollectionViewCell {
    
    public static let identifer = "OneLabelCollectionViewCell"
    
    public lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "custom"
        return label
    }()
    
    public var setSelected: (
        (UIView, Bool) -> Void
    )? = nil
    
    override var isSelected: Bool {
        didSet {
            setSelected?(self.contentView, isSelected)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .red
        contentView.addSubview(titleLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
    }
    
}
