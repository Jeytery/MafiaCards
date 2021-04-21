//
//  RolesCollectionViewDelegate.swift
//  MafiaCards
//
//  Created by Jeytery on 12.04.2021.
//  Copyright © 2021 Epsillent. All rights reserved.
//

import Foundation
import UIKit

class RolesCollectionViewDelegate: TypedCollectionViewDelegate {
    
    public init(collectionView: UICollectionView, roles: [Role]) {
        super.init(collectionView: collectionView)
        cellSize = CGSize(width: 300, height: 300)
        registerCell(
            cellClass: OneLabelCollectionViewCell.self,
            identifier: OneLabelCollectionViewCell.identifer)
        scrollDirection = .horizontal
        cellAtIndexPath = {
            collectionView, indexPath, data in
            guard let role = data[indexPath.row] as? Role else { return UICollectionViewCell() }
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: OneLabelCollectionViewCell.identifer,
                for: indexPath) as! OneLabelCollectionViewCell
            cell.contentView.backgroundColor = Colors.convertStringToColor(colorsName: role.color)
            cell.titleLabel.text = role.title
            return cell
        }
        update(data: roles)
    }
}
