//
//  Extensions.swift
//  QSTest
//
//  Created by Denys Volkov on 2020-05-17.
//  Copyright © 2020 quickseries. All rights reserved.
//

import UIKit

extension UIView {
    func addAndFill(_ subview: UIView) {
        subview.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(subview)
        self.addConstraints([
            NSLayoutConstraint(item: subview, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: subview, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: subview, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: subview, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1, constant: 0)
            ])
    }
}

extension UIViewController {
    func add(childViewController: UIViewController, to placeholder: UIView) {
        childViewController.willMove(toParent: self)
        self.addChild(childViewController)
        
        childViewController.view.frame = placeholder.bounds
        placeholder.addSubview(childViewController.view)
        placeholder.backgroundColor = .clear
        
        childViewController.didMove(toParent: self)
    }
    
    func embed(childViewController: UIViewController, to placeholder: UIView) {
        childViewController.willMove(toParent: self)
        self.addChild(childViewController)
        
        placeholder.addAndFill(childViewController.view)
        placeholder.backgroundColor = .clear
        
        childViewController.didMove(toParent: self)
    }
    
    func removeFromParentController() {
        self.willMove(toParent: nil)
        self.view.removeFromSuperview()
        self.removeFromParent()
        self.didMove(toParent: nil)
    }
    
    func hideBackBtnTitle() {
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
    }
    
    func showPopup(title: String, text: String) {
        let alertController = UIAlertController(title: title,
                                                message: text,
                                                preferredStyle: .alert)
        
        let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(OKAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
}

extension UITableView {
    func reloadWithoutAnimation() {
        self.layer.removeAllAnimations()
        reloadData()
        layoutIfNeeded()
    }
    
    func register(cells clsArray: [UITableViewCell.Type]) {
        for cls in clsArray {
            register(cellClass: cls)
        }
    }
    
    func register<T>(cellClass cls: T.Type) {
        let nibName = String(describing: cls)
        register(UINib(nibName: nibName, bundle: nil), forCellReuseIdentifier: nibName)
    }
    
    func register(cellTypes cls: [UITableViewCell.Type]) {
        cls.forEach { self.register(cellType: $0 )}
    }
    
    func register<T: UITableViewCell>(cellType cls: T.Type) {
        let cellClass = String(describing: cls)
        register(cls, forCellReuseIdentifier: cellClass)
    }
    
    func dequeueReusableCell<T: UITableViewCell>(cellClass cls: T.Type, for indexPath: IndexPath) -> T {
        let nibName = String(describing: cls)
        // swiftlint:disable force_cast
        return dequeueReusableCell(withIdentifier: nibName, for: indexPath) as! T
    }
    
    func dequeueReusableCell<T: UITableViewCell>(cellClass cls: T.Type) -> T {
        let nibName = String(describing: cls)
        // swiftlint:disable force_cast
        return dequeueReusableCell(withIdentifier: nibName) as! T
    }
    
    func dequeueReusableCellType<T: UITableViewCell>(cellClass cls: T.Type) -> T {
        return dequeueReusableCell(cellClass: cls)
    }
}
