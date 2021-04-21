//
//  RoleViewController.swift
//  MafiaCards
//
//  Created by Jeytery on 12.04.2021.
//  Copyright © 2021 Epsillent. All rights reserved.
//

import UIKit

class RoleViewController: UIViewController {

    @IBOutlet weak var colorView: UIView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var descriptionTextField: UITextField!
    
    @IBOutlet weak var colorsCollectionView: UICollectionView!

    private let role = Role(title: "", description: "", color: "")
    
    //MARK: - configure collectionView
    private func configureCollectionView() {
        let data = Colors.getAllColors()
        let delegate = TypedCollectionViewDelegate(
            collectionView: colorsCollectionView,
            data: data)
        
        delegate.registerCell(
            cellClass: OneLabelCollectionViewCell.self,
            identifier: OneLabelCollectionViewCell.identifer)
        
        delegate.cellAtIndexPath = {
            collectionView, indexPath, data in
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: OneLabelCollectionViewCell.identifer,
                for: indexPath) as! OneLabelCollectionViewCell
            
            cell.titleLabel.text = ""
            
            cell.contentView.backgroundColor = (data[indexPath.row] as! UIColor)
            
            return cell
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
    }
    
    //MARK: - public functions
    public init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    public init(role: Role) {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
