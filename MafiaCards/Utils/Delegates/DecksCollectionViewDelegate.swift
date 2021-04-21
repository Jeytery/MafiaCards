//
//  DecksCollectionViewDelegate.swift
//  MafiaCards
//
//  Created by Jeytery on 12.04.2021.
//  Copyright © 2021 Epsillent. All rights reserved.
//

import Foundation
import UIKit

class DecksCollectionViewDelegate: TypedCollectionViewDelegate {
    
    public init(collectionView: UICollectionView, decks: [Deck]) {
        super.init(collectionView: collectionView)
        
        cellSize = CGSize(width: 300, height: 300)
        
        registerCell(
            cellClass: OneLabelCollectionViewCell.self,
            identifier: OneLabelCollectionViewCell.identifer)
        scrollDirection = .horizontal
        
        cellAtIndexPath = {
            collectionView, indexPath, data in
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: OneLabelCollectionViewCell.identifer,
                for: indexPath) as! OneLabelCollectionViewCell
            cell.contentView.backgroundColor = .systemRed
            cell.titleLabel.text = (data[indexPath.row] as! Deck).title
            cell.contentView.backgroundColor = Colors.convertStringToColor(colorsName: (data[indexPath.row] as! Deck).color)
            cell.titleLabel.textColor = .white
            return cell
        }
        update(data: decks)
    }
}
