//
//  ViewController.swift
//  InterviewApp
//
//  Created by Georgi Popov on 2017-10-12.
//  Copyright © 2017 none. All rights reserved.
//

import UIKit
import Foundation
class CategoriesViewController: GenericViewController {
    enum Category : Int{
        case restaurants = 0
        case vacation_spot = 1
        
        static func getFileDisplay(category:Category) -> String {
            switch category {
            case .restaurants:
                return "restaurants"
            case .vacation_spot:
                return  "vacation-spot"
            }
        }
        
        func getDisplay() -> String {
            switch self {
            case .restaurants:
                return "Restaurants".localized
            case .vacation_spot:
                return  "Vacation Spots".localized
            }
        }
    }
    
    @IBOutlet weak var categoriesTable: UITableView!
    
    @IBAction func unwindToCategoriesViewController(segue:UIStoryboardSegue) { }
    
    fileprivate var categories : [[String : Any]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.categoriesTable.delegate = self
        self.categoriesTable.dataSource = self
        self.categoriesTable.tableFooterView = UIView()
        fillCategories()
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "category" {
            if let categoryIndex = sender as? Int {
                if let vc = segue.destination as? ResourcesListViewController {
                    if let category = Category.init(rawValue: categoryIndex) {
                        vc.resourcesListInitial = getJsonArray(fileName: Category.getFileDisplay(category: category))
                        vc.titleString = category.getDisplay()
                    }
                }
            }
        }
    }

    private func fillCategories() {
        self.categories = getJsonArray(fileName: "categories")
    }
    
    private func getJsonArray(fileName:String) -> [[String:Any]] {
        if let fileURL = Bundle.main.url(forResource: fileName, withExtension: "json") {
            if let data = try? Data(contentsOf: fileURL) {
                if let jsonArray = data.toJsonArray() {
                    return jsonArray
                }
            }
        }
        return []
    }

}

extension CategoriesViewController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.categories.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let category = self.categories[indexPath.row]
        if category[Constants.RESOURCE_DESCRIPTION_KEY] as? String != nil{
            return Constants.CELL_HEIGHT_LARGE
        }
        
        return Constants.CELL_HEIGHT_SMALL
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell") as? CategoryCell {
            let category = self.categories[indexPath.row]
            if let title = category[Constants.RESOURCE_TITLE_KEY] as? String {
                cell.categoryNameLabel.text = title
            }
            
            if let description = category[Constants.RESOURCE_DESCRIPTION_KEY] as? String {
                cell.categoryDescriptionLabel.text = description
                cell.categoryDescriptionLabel.isHidden = false
            } else {
                cell.categoryDescriptionLabel.isHidden = true
            }
            return cell
        }
        
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.performSegue(withIdentifier: "category", sender: indexPath.row)
    }
}
