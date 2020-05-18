//
//  ResourcesViewController.swift
//  QuickSeries
//
//  Created by Parth Patel on 14/05/20.
//  Copyright © 2020 Parth Patel. All rights reserved.
//

import UIKit

class ResourcesViewController: UIViewController {
    
    var category : Categories!
    var resources : [Resources] = []
    @IBOutlet weak var tableView: UITableView!
    var isSort : Bool = false
    @IBOutlet var sortButton: UIBarButtonItem!
    
    // MARK: - View Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchResourcesData()
        configureViewController()
        
    }
    
    
    // MARK: - Configure View
    
    func configureViewController() {
        self.title = category.title
        navigationController?.navigationBar.prefersLargeTitles = true
        self.tableView.tableFooterView = UIView(frame: .zero)
    }
    
    
    // MARK: - Handle Data
    
    func fetchResourcesData() {
        showLoadingView()
        guard let slugValue = category.slug else {                 presentAlertOnMainThread(title: "Alert", message: "URL is not available", buttonTitle: "Ok")
            return
        }
        NetworkManager.shared.getResources(slug: slugValue) { [weak self] result in
            guard let weakSelf = self else { return }
            weakSelf.dismissLoadingView()
            switch result {
                
            case .success(let resource):
                weakSelf.resources = resource
                weakSelf.updateData()
                
            case .failure(let error):
                weakSelf.presentAlertOnMainThread(title: "Bad Stuff Happend", message: error.rawValue, buttonTitle: "Ok")
                
            }
        }
    }
    
    func updateData() {
        DispatchQueue.main.async { self.tableView.reloadData() }
    }
    
    
    // MARK: - Handle Button Action
    
    @IBAction func buttonAction(_ sender: UIBarButtonItem) {
        isSort.toggle()
        let image: UIImage = (isSort ? UIImage(named: "sort-descending") : UIImage(named: "sort-ascending"))!
        sortButton.image = image
        isSort ? resources.sort { $0.title < $1.title } : resources.sort { $0.title > $1.title }
        updateData()
    }
        
}

extension ResourcesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.resources.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ListTableViewCell.reuseID, for: indexPath) as! ListTableViewCell
        cell.configureCellWithResources(self.resources[indexPath.row])
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.performSegue(withIdentifier: ViewControllerSegue.showResourceDetail.rawValue, sender: indexPath)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier,
            let identifierCase = ViewControllerSegue(rawValue: identifier), let indexPath = sender as? NSIndexPath else {
                return
        }

        switch identifierCase {
            case .showResourceDetail:
                let resourceDetailVC = segue.destination as! ResourcesDetailViewController
                resourceDetailVC.resource = self.resources[indexPath.row]
            case .showResources:
                break
        }
    }

}

