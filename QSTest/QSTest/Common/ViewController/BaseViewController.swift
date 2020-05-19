//
//  BaseViewController.swift
//  QSTest
//
//  Created by Denys Volkov on 2020-05-17.
//  Copyright © 2020 quickseries. All rights reserved.
//

import UIKit

protocol BaseViewControllerProtocol: AnyObject {
    var loadingController: LoadingViewController? { get set }
    
    func show(error: NSError)
    func show(message: String, title: String?)
    
    func showLoadingController(aboveNavBar: Bool)
    func hideLoadingController()
    func set(title: String)
}

class BaseViewController: UIViewController {
    var loadingController: LoadingViewController?
    
    enum LoadType {
        case programmatically
        case xib
        case xibWith(suffix: String)
        case xibName(String)
    }
    
    // MARK: - Life cycle
    init(loadType: LoadType = .xib) {
        var nibName: String
        
        switch loadType {
        case .programmatically:
            super.init(nibName: nil, bundle: nil)
            return
        case .xib:
            nibName = type(of: self).className
        case let .xibWith(suffix):
            nibName = type(of: self).className + suffix
        case let .xibName(name):
            nibName = name
        }
        
        super.init(nibName: nibName, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        return nil
    }
}

extension BaseViewController: BaseViewControllerProtocol {
    func set(title: String) {
        self.title = title
    }
    
    func show(error: NSError) {
        self.show(message: error.localizedDescription, title: "Error occured".localized)
    }
    
    func show(message: String, title: String?) {
        let popup = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        
        let positiveAction = UIAlertAction(title: "ok",
                                           style: .default,
                                           handler: nil)
        popup.addAction(positiveAction)
        popup.preferredAction = positiveAction
        
        self.present(popup, animated: true, completion: nil)
    }
    
    func showLoadingController(aboveNavBar: Bool) {
        showLoadingController(on: self, view: self.view)
    }
    
    func showLoadingController(on controller: UIViewController, view: UIView) {
        loadingController = LoadingViewController()
        controller.add(childViewController: loadingController!, to: view)
    }
    func hideLoadingController() {
        loadingController?.removeFromParentController()
        loadingController = nil
    }
}
