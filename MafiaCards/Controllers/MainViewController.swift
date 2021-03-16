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
        tableView.register(
            UINib(
                nibName: "NewDeckTableViewCell",
                bundle: nil
            ),
            forCellReuseIdentifier: NewDeckTableViewCell.identifier
        )
        
        tableView.register(
            UINib(
                nibName: "DecksTableViewCell",
                bundle: nil
            ),
            forCellReuseIdentifier: DecksTableViewCell.identifier
        )
        
        tableView.register(
            UINib(
                nibName: "RolesTableViewCell",
                bundle: nil
            ),
            forCellReuseIdentifier: RolesTableViewCell.identifier
        )
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    //MARK: - public funcs

    
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
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
                withIdentifier: DecksTableViewCell.identifier,
                for: indexPath) as! DecksTableViewCell
            
            let decksArr = [
                Deck(title: "First", description: "deck1", roles: [Role]()),
                Deck(title: "Second", description: "deck2", roles: [Role]()),
                Deck(title: "Third", description: "deck3", roles: [Role]()),
                Deck(title: "Fourth", description: "deck4", roles: [Role]()),
                Deck(title: "First", description: "deck1", roles: [Role]()),
                Deck(title: "Second", description: "deck2", roles: [Role]()),
                Deck(title: "Third", description: "deck3", roles: [Role]()),
                Deck(title: "First", description: "deck1", roles: [Role]()),
                Deck(title: "Second", description: "deck2", roles: [Role]()),
                Deck(title: "Third", description: "deck3", roles: [Role]()),
                Deck(title: "First", description: "deck1", roles: [Role]()),
                Deck(title: "Second", description: "deck2", roles: [Role]()),
                Deck(title: "Third", description: "deck3", roles: [Role]())
            ]
            
            cell.setDecks(decks: decksArr)
            
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(
                withIdentifier: RolesTableViewCell.identifier,
                for: indexPath
            ) as! RolesTableViewCell
            
            let roles = [
                Role(title: "1", description: "1", color: ""),
                Role(title: "2", description: "1", color: ""),
                Role(title: "3", description: "1", color: ""),
                Role(title: "4", description: "1", color: "")
            ]
                
            cell.setRoles(roles: roles)
            return cell
        
        default:
            return UITableViewCell()
        }
    }
}

