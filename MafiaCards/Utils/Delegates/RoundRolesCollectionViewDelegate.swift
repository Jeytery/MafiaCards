//
//  RoundRolesCollectionView.swift
//  MafiaCards
//
//  Created by user on 3/16/21.
//  Copyright © 2021 Epsillent. All rights reserved.
//

import Foundation
import UIKit

class RoundRolesCollectionViewDelegate: TypedCollectionViewDelegate {
    
    public init(collectionView: UICollectionView, roles: [Role]) {
        super.init(collectionView: collectionView)
        cellSize = CGSize(width: 80, height: 80)
        scrollDirection = .vertical
        registerCell(
            cellClass: OneLabelCollectionViewCell.self,
            identifier: OneLabelCollectionViewCell.identifer)
        scrollDirection = .horizontal
        cellAtIndexPath = {
            collectionView, indexPath, data in
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: OneLabelCollectionViewCell.identifer,
                for: indexPath) as! OneLabelCollectionViewCell
            cell.contentView.layer.cornerRadius = 20
            cell.contentView.backgroundColor = .systemRed
            cell.titleLabel.text = (data[indexPath.row] as! Role).title
            cell.titleLabel.textColor = .white
            cell.contentView.backgroundColor = Colors.convertStringToColor(colorsName: (data[indexPath.row] as! Role).color)
            return cell
        }
        
        update(data: roles)
    }

}
