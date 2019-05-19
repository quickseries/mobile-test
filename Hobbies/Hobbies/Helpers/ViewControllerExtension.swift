//
//  ViewControllerExtension.swift
//  Hobbies
//
//  Created by Amir Daliri on 5/18/19.
//  Copyright © 2019 ADA-Company. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

extension Reactive where Base: UIViewController {
    
    public var isLoading: Binder<Bool> {
        return Binder(self.base, binding: { (vc, active) in
            if active {
                vc.startAnimating()
            } else {
                vc.stopAnimating()
            }
        })
    }
}


protocol LoadingView {
    func startAnimating()
    func stopAnimating()
}
extension LoadingView where Self : UIViewController {
    func startAnimating(){
       LoadingUtility.showLoading()
    }
    func stopAnimating() {
        LoadingUtility.hideLoading()
    }
}

extension UIViewController: LoadingView
{
}

extension UIViewController
{
    func removeTableViewExtraEmptyCells(tableView: UITableView)
    {
        tableView.tableFooterView = UIView(frame: .zero)
    }
}


