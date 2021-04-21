//
//  RolesViewController.swift
//  MafiaCards
//
//  Created by Jeytery on 14.04.2021.
//  Copyright © 2021 Epsillent. All rights reserved.
//

import UIKit

class RolesViewController: UIViewController {

    //MARK: - vars
    @IBOutlet weak var rolesCollectionView: UICollectionView!
    
    public var cellOnClick: (
        (UICollectionView, IndexPath, [Role]) -> Void
    )? = nil
    
    private lazy var delegate = RolesCollectionViewDelegate(
        collectionView: rolesCollectionView,
        roles: [
            Role(title: "Mafia", description: "1", color: "Red"),
            Role(title: "Don", description: "1", color: "Green"),
            Role(title: "Peaceful", description: "1", color: "Red"),
            Role(title: "Sheriff", description: "1", color: "Red"),
            Role(title: "Cat", description: "1", color: "Red"),
            Role(title: "Jerry", description: "1", color: "Red"),
            Role(title: "Jeytery", description: "1", color: "Green")
        ])
    
    //MARK: - congirue collectionView
    private func configureCollectionView() {
    
        delegate.cellOnClick = {
            [unowned self] collectionView, indexPath, data in
            let roles = data as! [Role]
            cellOnClick?(collectionView, indexPath, roles)
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
    }
    
    //MARK: - public functions
    
    
}
