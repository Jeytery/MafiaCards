//
//  MainNaviagationViewController.swift
//  MafiaCards
//
//  Created by user on 3/11/21.
//  Copyright © 2021 Epsillent. All rights reserved.
//

import UIKit

class MainNaviagationViewController: UINavigationController {

    //MARK: - private funcs
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
