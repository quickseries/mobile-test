//
//  CategoryListViewController.swift
//  QSMobileTest
//
//  Created by Munib Siddiqui on 20/05/2019.
//  Copyright © 2019 Munib Siddiqui. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

enum CategoryType :String {
    case restaurants,vacationspots
}

class CategoryListViewController: UIViewController {

    var categoryViewModel = CategoryViewModel()
    let disposeBag = DisposeBag()

    @IBOutlet private weak var tracksTableView: UITableView!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Categories"
        
        setupBindings()
        
        categoryViewModel.requestData()
        
    }
    
    private func setupBindings() {
        
        bindTableView()
        bindTableViewSelected()
        bindErrorHandler ()
    }
    
    private func bindTableView() {
        
        tracksTableView.register(UINib(nibName: "CategoryTableViewCell", bundle: nil), forCellReuseIdentifier: String(describing: CategoryTableViewCell.self))
        
        categoryViewModel.categories
            .bind(to: tracksTableView.rx.items(cellIdentifier: "CategoryTableViewCell", cellType: CategoryTableViewCell.self)) {  (row,category,cell) in
                cell.category = category
            }.disposed(by: disposeBag)
        
        tracksTableView.rx.willDisplayCell
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
        
        tracksTableView.rx.modelSelected(Category.self)
            .subscribe(onNext: { item in
                guard let taskDetailsVC = self.storyboard?.instantiateViewController(withIdentifier: "ResourcesListViewController") as? ResourcesListViewController else {
                    fatalError("ResourcesListViewController not found")
                }
                taskDetailsVC.category = item
                self.navigationController?.pushViewController(taskDetailsVC, animated: true)
            }).disposed(by: disposeBag)
        
    }
    
    private func bindErrorHandler () {
        
        // observing errors to show
        
        categoryViewModel
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
