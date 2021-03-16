//
//  DeckCollectionViewDelegate.swift
//  MafiaCards
//
//  Created by user on 3/13/21.
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
    private var collectionView: UICollectionView
    
    private var decks: [Deck] = [Deck]()
    
    //MARK: - iternal
    private func configure() {
        collectionView.register(
            UINib.init(nibName: "DeckCollectionViewCell", bundle: nil),
            forCellWithReuseIdentifier: DeckCollectionViewCell.identifier
        )
        (collectionView.collectionViewLayout as? UICollectionViewFlowLayout)?.scrollDirection = .horizontal
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
        cell.titleLabel.text = decks[indexPath.row].title
        cell.mainView.backgroundColor = .cyan
        return cell
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath) -> CGSize
    {
       return CGSize(width: 200, height: 200)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("123")
    }
            
    //MARK: - public funcs
    public init(collectionView: UICollectionView, decks: [Deck]) {
        self.collectionView = collectionView
        self.decks = decks
        super.init()
        configure()
    }
    
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
