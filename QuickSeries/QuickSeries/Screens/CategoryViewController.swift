//
//  ViewController.swift
//  QuickSeries
//
//  Created by Parth Patel on 13/05/20.
//  Copyright © 2020 Parth Patel. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController {
    
    var category : [Categories] = []
    @IBOutlet weak var tableView: UITableView!
    
    
    // MARK: - View Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()        
        fetchCategoryData()
        configureViewController()
    }
    
    // MARK: - Configure View
    
    func configureViewController() {
        self.tableView.tableFooterView = UIView(frame: .zero)
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    
    // MARK: - Handle Data
    
    func fetchCategoryData() {
        showLoadingView()
        NetworkManager.shared.getCategories { [weak self] result in
            guard let weakSelf = self else { return }
            weakSelf.dismissLoadingView()
            switch result {
                
            case .success(let categories):
                weakSelf.category = categories
                weakSelf.updateData()
                
            case .failure(let error):
                weakSelf.presentAlertOnMainThread(title: "Bad Stuff Happend", message: error.rawValue, buttonTitle: "Ok")
                
            }
        }
    }
    
    func updateData() {
        DispatchQueue.main.async { self.tableView.reloadData() }
    }
    
}

extension CategoryViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.category.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ListTableViewCell.reuseID, for: indexPath) as! ListTableViewCell
        
        cell.configureCellWith(self.category[indexPath.row])
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.performSegue(withIdentifier: ViewControllerSegue.showResources.rawValue, sender: indexPath)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier,
            let identifierCase = ViewControllerSegue(rawValue: identifier), let indexPath = sender as? NSIndexPath else {                
                return
        }
        
        switch identifierCase {
            case .showResources:                
                let resourceVC = segue.destination as! ResourcesViewController
                resourceVC.category = self.category[indexPath.row]
            case .showResourceDetail:
                break
        }
        
    }
}

