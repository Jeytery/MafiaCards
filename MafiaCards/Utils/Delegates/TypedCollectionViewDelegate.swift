//
//  ReactiveCollectionViewDelegate.swift
//  MafiaCards
//
//  Created by Jeytery on 3/28/21.
//  Copyright © 2021 Epsillent. All rights reserved.
//

import Foundation
import UIKit

class TypedCollectionViewDelegate:
    NSObject,
    UICollectionViewDelegate,
    UICollectionViewDataSource,
    UICollectionViewDelegateFlowLayout
{
    //MARK: - vars
    public var scrollDirection: ScrollDirection {
        get {
            if (collectionView.collectionViewLayout as? UICollectionViewFlowLayout)?.scrollDirection == .horizontal {
                return .horizontal
            } else {
                return .vertical
            }
        }
            
        set(newValue) {
            if newValue == .horizontal {
                (collectionView.collectionViewLayout as? UICollectionViewFlowLayout)?.scrollDirection = .horizontal
            } else if newValue == .vertical {
                (collectionView.collectionViewLayout as? UICollectionViewFlowLayout)?.scrollDirection = .vertical
            }
        }
    }
    
    public var cellSize = CGSize(width: 100, height: 100)
    
    public var cellAtIndexPath: (
        (UICollectionView, IndexPath, [Any]) -> UICollectionViewCell
    )? = nil
    
    public var cellOnClick: (
        (UICollectionView, IndexPath, [Any]) -> Void
    )? = nil
    
    private var data = [Any]()
    
    private unowned var collectionView: UICollectionView
    
    //MARK: - iternal functions
    private func configureCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int)
        -> Int
    {
        return data.count
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath)
        -> UICollectionViewCell
    {
        return cellAtIndexPath?(collectionView, indexPath, data) ?? UICollectionViewCell()
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath)
    {
        cellOnClick?(collectionView, indexPath, data)
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return cellSize
    }
    
    //MARK: - public functions
    public init(
        collectionView: UICollectionView,
        data: [Any])
    {
        self.data = data
        self.collectionView = collectionView
        super.init()
        configureCollectionView()
    }
    
    public init(collectionView: UICollectionView) {
        self.collectionView = collectionView
        super.init()
        configureCollectionView()
    }
    
    public func registerCell(nibName: String, identifier: String) {
        collectionView.register(
            UINib.init(
                nibName: nibName,
                bundle: nil),
            forCellWithReuseIdentifier: identifier)
    }
    
    public func registerCell(cellClass: AnyClass, identifier: String) {
        collectionView.register(
            cellClass,
            forCellWithReuseIdentifier: identifier)
    }
    
    public func update(data: [Any]) {
        self.data = data
        collectionView.reloadData()
    }
    
    public func update(collectionView: UICollectionView) {
        self.collectionView = collectionView
        self.configureCollectionView()
    }
}


extension TypedCollectionViewDelegate {
    
    enum ScrollDirection {
        case vertical
        case horizontal
    }
}
