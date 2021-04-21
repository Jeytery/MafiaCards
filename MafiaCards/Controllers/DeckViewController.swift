//
//  DeckViewController.swift
//  MafiaCards
//
//  Created by user on 3/16/21.
//  Copyright © 2021 Epsillent. All rights reserved.
//

import UIKit

class DeckViewController: UIViewController {
    
    //MARK: - var
    @IBOutlet weak var editTableView: UITableView!
    
    public var shutDownHandler: (
        (Deck?) -> Void
    )? = nil
    
    private var rolesCollectionViewDelegate: RoundRolesCollectionViewDelegate?
    
    private var deck: Deck

    //MARK: - iternal funcs
    @objc func close() {
        self.dismiss(animated: true, completion: nil)
    }
    
    private func configure() {
        self.title = deck.title
        editTableView.dataSource = self
        editTableView.delegate = self
        editTableView.register(UINib(
            nibName: "CollectionViewLabelTableViewCell",
            bundle: nil),
            forCellReuseIdentifier: CollectionViewLabelTableViewCell.identifier)
        editTableView.allowsSelection = false 
    }
    
    @objc func buttonAction() {
        print("hello")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    //MARK: - public funcs
    public init(deck: Deck) {
        self.deck = deck
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func hideTitleTextField() {
        
    }
}

extension DeckViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 80
        case 1:
            return 220
        case 2:
            return 220
        case 3:
            return 100
        default:
            return 100
        }
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = CustomTableViewCell()
            var textField = UITextField()
            textField.placeholder = "Deck's Name"
            Design.setGreyStyle(textField: &textField)
            textField.text = deck.title
            
            cell.contentView.addSubview(textField)
        
            cell.configureFrame = {
                view in
                textField.frame = CGRect(
                    x: 5,
                    y: view.frame.height/2 - 30,
                    width: view.frame.width-5,
                    height: 60)
            }
                
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(
                withIdentifier: CollectionViewLabelTableViewCell.identifier,
                for: indexPath) as! CollectionViewLabelTableViewCell
            cell.titleLabel.text = "Roles"
            rolesCollectionViewDelegate = RoundRolesCollectionViewDelegate(
                collectionView: cell.collectionView,
                roles: deck.roles)
            
            rolesCollectionViewDelegate?.cellOnClick = {
                collectionView, indexPath, data in
                let roleVC = RolesViewController()
                
                roleVC.cellOnClick = {
                    _, _indexPath, roles in
                    UIFragmentManager.shared.hide(
                        fragmentVC: roleVC,
                        completion: nil)
                    var _data = data
                    _data[indexPath.row] = roles[_indexPath.row]
                    self.rolesCollectionViewDelegate?.update(data: _data)
                }
                
                UIFragmentManager.shared.show(
                    fragmentVC: roleVC,
                    parameters: Manager.fragmentParameters.card,
                    completion: nil)
            }
            cell.collectionViewDelegate = rolesCollectionViewDelegate!
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(
                withIdentifier: CollectionViewLabelTableViewCell.identifier,
                for: indexPath) as! CollectionViewLabelTableViewCell
            cell.titleLabel.text = "Player's count"
            var data = [String]()
            
            for i in 1...25 {
                data.append(String(i))
            }
            
            let delegate = TypedCollectionViewDelegate(
                collectionView: cell.collectionView,
                data: data)
            
            cell.collectionView.selectItem(
                at: IndexPath(row: deck.roles.count - 1, section: 0),
                animated: true,
                scrollPosition: .centeredHorizontally)
        
            delegate.registerCell(
                cellClass: OneLabelCollectionViewCell.self,
                identifier: OneLabelCollectionViewCell.identifer)
            
            delegate.scrollDirection = .horizontal
            
            delegate.cellAtIndexPath = {
                collectionView, indexPath, data in
                let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: OneLabelCollectionViewCell.identifer,
                    for: indexPath) as! OneLabelCollectionViewCell
                
                cell.setSelected = {
                    view, isSelected in
                    view.backgroundColor = isSelected ? .systemRed : Colors.lightGray
                    cell.titleLabel.textColor = isSelected ? .white : .black
                }
                
                cell.contentView.backgroundColor = Colors.lightGray
                cell.titleLabel.text = (data[indexPath.row] as! String)
                return cell
            }
            
            delegate.cellOnClick = {
                [unowned self] collectionView, indexPath, data in
                self.deck.roles.removeAll()
                for _ in 0..<indexPath.row + 1 {
                    self.deck.roles.append(Role(
                        title: "No Role",
                        description: "",
                        color: "Red"))
                }
                
                self.rolesCollectionViewDelegate?.update(data: self.deck.roles)
            }
            
            cell.collectionViewDelegate = delegate
            return cell
            
        case 3:
            let cell = CustomTableViewCell()
            let button = UIButton()
            button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
            button.backgroundColor = .red
            button.setTitle(localize(id: SHUFFLE_BUTTON_TITLE), for: .normal)
            cell.contentView.addSubview(button)
            cell.configureFrame = {
                view in
                button.frame = CGRect(
                    x: 5,
                    y: view.frame.height/2 - 30,
                    width: view.frame.width - 5,
                    height: 60)
            }
            return cell
        default:
            return UITableViewCell()
        }
    }
}


class uiDeckNaviagationController {
    
}
