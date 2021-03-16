//
//  DecksCollectionViewDelegate.swift
//  MafiaCards
//
//  Created by user on 3/16/21.
//  Copyright © 2021 Epsillent. All rights reserved.
//

import Foundation
import UIKit

class DecksCollectionViewDelegate:
    NSObject,
    UICollectionViewDelegate,
    UICollectionViewDataSource,
    UICollectionViewDelegateFlowLayout
{

    
    //MARK: - vars
    private var decks = [Deck]()
    
    private var collectionView: UICollectionView
    
    //MARK: - iternal funcs
    private func configure() {
        collectionView.register(
           UINib.init(
               nibName: "DeckCollectionViewCell",
               bundle: nil),
           forCellWithReuseIdentifier: DeckCollectionViewCell.identifier
        )
        (collectionView.collectionViewLayout as? UICollectionViewFlowLayout)?.scrollDirection = .horizontal
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return decks.count
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: DeckCollectionViewCell.identifier,
            for: indexPath) as! DeckCollectionViewCell
        cell.layer.cornerRadius = 10
        cell.backgroundColor = Design.calmOrange
        cell.titleLabel.text = decks[indexPath.row].title
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
    
    public func update(decks: [Deck]) {
        self.decks = decks
        collectionView.reloadData()
    }
    
}
