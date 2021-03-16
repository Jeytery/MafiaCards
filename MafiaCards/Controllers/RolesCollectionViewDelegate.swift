//
//  RolesCollectionViewDelegate.swift
//  MafiaCards
//
//  Created by user on 3/16/21.
//  Copyright © 2021 Epsillent. All rights reserved.
//

import Foundation
import UIKit

class RolesCollectionViewDelegate:
    NSObject,
    UICollectionViewDelegate,
    UICollectionViewDataSource,
    UICollectionViewDelegateFlowLayout
{
    //MARK: - var
    private var roles = [Role]()
    
    private var collectionView: UICollectionView
    
    //MARK: - iternal funcs
    private func configure() {
        collectionView.register(
            UINib.init(
                nibName: "RoleCollectionViewCell",
                bundle: nil),
            forCellWithReuseIdentifier: RoleCollectionViewCell.identifier
        )
        (collectionView.collectionViewLayout as? UICollectionViewFlowLayout)?.scrollDirection = .horizontal
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return roles.count
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: RoleCollectionViewCell.identifier,
            for: indexPath
        ) as! RoleCollectionViewCell
        cell.setRole(role: roles[indexPath.row])
        cell.mainView.backgroundColor = .red
        return cell
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath) -> CGSize
    {
       return CGSize(width: 200, height: 200)
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath)
    {
        print(indexPath.row)
    }
    
    //MARK: - public funcs
    public init(collectionView: UICollectionView) {
        self.collectionView = collectionView
        super.init()
        configure()
    }
    
    public init(
        collectionView: UICollectionView,
        roles: [Role])
    {
        self.collectionView = collectionView
        self.roles = roles
        super.init()
        configure()
    }
    
    public func update(roles: [Role]) {
        self.roles = roles
        collectionView.reloadData()
    }
    
}
