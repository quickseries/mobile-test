//
//  ViewController.swift
//  ResourceViewer
//
//  Created by Tarang Patel on 2017-11-12.
//  Copyright © 2017 Tarang Patel. All rights reserved.
//

import UIKit

class CategoryViewController: UITableViewController {

    enum Route: String {
        case restaurants
        case vacationSpots
    }
    
    let viewModel = CategoryViewModel()
    var router: Router!
    
    let reuseIdentifier = "CategoryCell"
    var categoryList: [Category]? = [] {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Categories"
        
        viewModel.isFetchSuccessful.bind { (success) in
            if success {
                self.categoryList = self.viewModel.categories
            }
            else {
                let alert = UIAlertController(title: "Alert", message: "Data not found", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }
        
        viewModel.getCateoryList()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        self.categoryList = nil
    }
}


extension CategoryViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {        
        return self.categoryList!.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = tableView.dequeueReusableCell(withIdentifier: self.reuseIdentifier,
                                                 for: indexPath)
        
        let category = self.categoryList![indexPath.row]
        cell.textLabel?.text = category.title
        cell.detailTextLabel?.text = category.description?.html2String
        
        return cell
    }
    
}


extension CategoryViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCategory = self.categoryList![indexPath.row]
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyBoard.instantiateViewController(withIdentifier: "ResourcesTableViewController") as? ResourcesTableViewController {
            let vm = ResourcesViewModel(category: selectedCategory)
            vc.viewModel = vm
            self.navigationController?.pushViewController(vc, animated: true)
        }
        else {
            print("Resource VC not found")
        }
    }

}
