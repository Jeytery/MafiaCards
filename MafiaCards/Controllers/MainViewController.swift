//
//  MainViewController.swift
//  MafiaCards
//
//  Created by user on 3/11/21.
//  Copyright © 2021 Epsillent. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - private funcs
    private func configure() {
        self.view.backgroundColor = .white
        self.title = "MafiaCards"
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsSelection = false 
        
        tableView.register(UINib(
            nibName: "NewDeckTableViewCell",
            bundle: nil),
            forCellReuseIdentifier: NewDeckTableViewCell.identifier)
        
        tableView.register(UINib(
            nibName: "CollectionViewLabelTableViewCell",
            bundle: nil),
            forCellReuseIdentifier: CollectionViewLabelTableViewCell.identifier
        )    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        switch section {
        case 0:
            return 3
        default:
            return 0
        }
    }
    
    func tableView(
        _ tableView: UITableView,
        heightForRowAt indexPath: IndexPath
    ) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 140
        case 1:
            return 250
        case 2:
            return 250
        default:
            return 0
        }
    }
        
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
                
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(
                withIdentifier: NewDeckTableViewCell.identifier,
                for: indexPath) as! NewDeckTableViewCell
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(
                withIdentifier: CollectionViewLabelTableViewCell.identifier,
                for: indexPath) as! CollectionViewLabelTableViewCell
           
            cell.showOptionButton(
                title: "Add",
                action:
            {
                let vc = DeckViewController(deck: Deck(
                    title: "Unnamed Deck",
                    color: "Red",
                    description: "Unnamed Deck",
                    roles: [Role(title: "No Role", description: "", color: "")]))
                self.navigationController?.pushViewController(vc, animated: true)
            })
            
            cell.collectionViewDelegate = DecksCollectionViewDelegate(
                collectionView: cell.collectionView,
                decks:
            [
                Deck(title: "Classical Deck", color: "Black", description: "Black", roles: [
                    Role(title: "Mafia", description: "", color: "Black"),
                    Role(title: "Doctor", description: "", color: "Green"),
                    Role(title: "Sheriff", description: "", color: "Green"),
                    Role(title: "Don", description: "", color: "Red")]),
                
                Deck(title: "8 Players", color: "Green", description: "Red", roles: [
                    Role(title: "1", description: "", color: "Black"),
                    Role(title: "3", description: "", color: "Black"),
                    Role(title: "4", description: "", color: "Green"),
                    Role(title: "5", description: "", color: "Red")])
            ])
            
            cell.collectionViewDelegate?.cellOnClick = {
                [unowned self] collectionView, indexPath, data in
                let vc = DeckViewController(deck: data[indexPath.row] as! Deck) 
                self.navigationController?.pushViewController(vc, animated: true)
            }
            
            cell.titleLabel.text = localize(id: TABLEVIEW_DECKS_LABEL)

            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(
                withIdentifier: CollectionViewLabelTableViewCell.identifier,
                for: indexPath) as! CollectionViewLabelTableViewCell
            
            cell.showOptionButton(
                title: "Add",
                action:
            {
            })
            
            cell.collectionViewDelegate = RolesCollectionViewDelegate(
                collectionView: cell.collectionView,
                roles:
            [
                Role(title: "wfw", description: "", color: ""),
                Role(title: "wfw", description: "", color: ""),
                Role(title: "wfw", description: "", color: ""),
                Role(title: "wfw", description: "", color: ""),
                Role(title: "wfw", description: "", color: ""),
                Role(title: "wfw", description: "", color: "")
            ])
            
            cell.titleLabel.text = localize(id: TABLEVIEW_ROLES_LABEL)
            return cell
        
        default:
            return UITableViewCell()
        }
    }
}


class MainNaviagationViewController: UINavigationController {

    
    private func configure() {
        if #available(iOS 11.0, *) {
            self.navigationBar.prefersLargeTitles = true
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    //MARK: - public funcs

}
