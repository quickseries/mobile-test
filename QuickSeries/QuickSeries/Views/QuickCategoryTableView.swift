//
//  QuickCategoryTableView.swift
//  QuickSeries
//
//  Created by Engineer 144 on 17/05/2019.
//

import UIKit

class QuickCategoryTableView: UITableViewController {
    
    
    private var categoriesviewModel : CategoriesViewModel!
    private var dataSource : QuickTableViewDataSource<QuickCategoryTableViewCell, CategoryViewModel>!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()

    }
    
    
    
    private func updateUI() {
        
      
        self.categoriesviewModel = CategoriesViewModel(key: "")
        self.categoriesviewModel.bindSourceToModels = {
            
            self.updateDataSource()
        }
       
        // setting up the bindings
        
        
    }
    
    private func updateDataSource() {
        
        self.dataSource = QuickTableViewDataSource(cellIdentifier: Cells.categoryCell, items: self.categoriesviewModel.categoryViewModels) { cell, category in
            
            
            cell.title.text = category.category.title
            cell.descriptionLabel.text = category.category.description
            cell.icon.image = category.image
            
        }
        
        self.tableView.dataSource = self.dataSource
        self.tableView.reloadData()
    }

   
}
