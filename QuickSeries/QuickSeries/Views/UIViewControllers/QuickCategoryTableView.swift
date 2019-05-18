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
        
        initUIValues()

    }
    
    
    
    private func initUIValues() {
        
      
        self.categoriesviewModel = CategoriesViewModel(key: "")
        self.categoriesviewModel.bindSourceToModels = {
            
            self.updateDataSource()
        }
       
       
        
        
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

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == Segues.categoryItems {
            performSegueForShowSourceDetails(segue: segue)
            
        }
    }
    
    
    private func performSegueForShowSourceDetails(segue :UIStoryboardSegue) {
        
        guard let indexPath = self.tableView.indexPathForSelectedRow else {
            fatalError("indexPath not found")
        }
        
        let categoryViewModel = self.categoriesviewModel.source(at: indexPath.row)
        let detailView = segue.destination as! QuickCategoryItemsCVController
        detailView.categoryViewModel = categoryViewModel
    }
}


