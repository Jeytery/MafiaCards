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
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    //MARK: - public funcs

    
}
