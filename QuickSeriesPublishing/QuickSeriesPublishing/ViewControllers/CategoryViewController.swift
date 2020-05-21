//
//  ViewController.swift
//  QuickSeriesPublishing
//
//  Created by Tony Tran on 2020-05-21.
//  Copyright © 2020 quickseries. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController {
    @IBOutlet private weak var categoryTableView: UITableView!
    
    private var viewModel: CategoryViewModel?
    private var categories = [Category]()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = CategoryViewModel(interactor: CategoryInteractor())
        setTitle()
        setupTableView()
        fetchCategories()
    }
}

private extension CategoryViewController {
    func setTitle() {
        self.title = "Category"
    }
    
    func setupTableView() {
        categoryTableView.delegate = self
        categoryTableView.dataSource = self
        categoryTableView.rowHeight = UITableView.automaticDimension

        
        let nib = UINib(nibName: String(describing: CategoryTableViewCell.self), bundle: Bundle(for: CategoryTableViewCell.self))
        categoryTableView.register(nib, forCellReuseIdentifier: String(describing: CategoryTableViewCell.self))
    }
    
    func fetchCategories() {
        guard let viewModel = viewModel else { return }
        
        viewModel.fetch { [weak self] result in
            guard let strongSelf = self else { return }
            
            strongSelf.categories = result
            DispatchQueue.main.async {
                strongSelf.categoryTableView.reloadData()
            }
        }
    }
}

extension CategoryViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: CategoryTableViewCell.self), for: indexPath) as? CategoryTableViewCell else {
            return UITableViewCell()
        }
        
        cell.updateCell(with: categories[indexPath.item])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cat = categories[indexPath.item]
        
        if cat.slug == "restaurants" {
            let viewController = ResourceViewController(cat.eid!)
            navigationController?.pushViewController(viewController, animated: true)
        } else {
            let alert = UIAlertController(title: "Message",
                                          message: "This is alert for vacation-spot",
                                          preferredStyle: UIAlertController.Style.alert)

            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: { _ in
                //Cancel Action
            }))
         
            self.present(alert, animated: true, completion: nil)
        }
    }
}

