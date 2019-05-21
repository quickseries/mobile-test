//
//  ResourcesListViewController.swift
//  QSMobileTest
//
//  Created by Munib Siddiqui on 20/05/2019.
//  Copyright © 2019 Munib Siddiqui. All rights reserved.
//

import UIKit
import RxSwift

class ResourcesListViewController: UIViewController {

    @IBOutlet private weak var resourceTableView: UITableView!
    
    var category: Category?
    var resourceViewModel: ResourceViewModel?
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Resources"
        
        resourceViewModel = ResourceViewModel(category: category)
        resourceViewModel?.requestData()
        
        setupBindings()
    }

    private func setupBindings() {
        
        bindTableView()
        bindTableViewSelected()
        bindErrorHandler ()
    }
    
    private func bindTableView() {
        
        resourceTableView.register(UINib(nibName: "ResourceTableViewCell", bundle: nil), forCellReuseIdentifier: String(describing: ResourceTableViewCell.self))
        
        resourceViewModel?.resources
            .bind(to: resourceTableView.rx.items(cellIdentifier: "ResourceTableViewCell", cellType: ResourceTableViewCell.self)) {  (row,resource,cell) in
                cell.resource = resource
            }.disposed(by: disposeBag)
        
        resourceTableView.rx.willDisplayCell
            .subscribe(onNext: ({ (cell,indexPath) in
                cell.alpha = 0
                let transform = CATransform3DTranslate(CATransform3DIdentity, -250, 0, 0)
                cell.layer.transform = transform
                UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
                    cell.alpha = 1
                    cell.layer.transform = CATransform3DIdentity
                }, completion: nil)
            })).disposed(by: disposeBag)
    }
    
    private func bindTableViewSelected () {
        
        resourceTableView.rx.modelSelected(Resource.self)
            .subscribe(onNext: { item in
                
                guard let resourceDetailsVC = self.storyboard?.instantiateViewController(withIdentifier: "ResourceDetailViewController") as? ResourceDetailViewController else {
                    fatalError("ResourceDetailViewController not found")
                }
                resourceDetailsVC.resource = item
                self.navigationController?.pushViewController(resourceDetailsVC, animated: true)
                
            }).disposed(by: disposeBag)
        
    }
    
    private func bindErrorHandler () {
        
        // observing errors to show
        
        resourceViewModel?
            .error
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { (error) in
                switch error {
                case .internetError(let message): break
                //MessageView.sharedInstance.showOnView(message: message, theme: .error)
                case .serverMessage(let message): break
                    //MessageView.sharedInstance.showOnView(message: message, theme: .warning)
                }
            })
            .disposed(by: disposeBag)
    }
    
}
