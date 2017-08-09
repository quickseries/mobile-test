//
//  CategoriesTableViewController.swift
//  mobile-test
//
//  Created by Martin Gyupchanov on 09-08-17.
//  Copyright © 2017 Martin Gyupchanov. All rights reserved.
//

import UIKit

class CategoriesTableViewController: UITableViewController {
  
  // MARK: - Model
  var categories = [Category?]() {
    didSet {
      tableView.reloadData()
    }
  }
  
  var selectedCategory = ""
  var isSortedAscending = false
  
  // MARK: - VC Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    
    title = "Categories"
    categories = CategoriesJSONParser.getCategories()
    
    addSortButton()
  }
  
  func addSortButton() {
    //let rightShareBarButtonItem: UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.action, target: self, action: #selector(self.sort))
    
    let sortButton = UIBarButtonItem(title: "Sort", style: .plain, target: self, action: #selector(self.sort))
    self.navigationItem.setRightBarButtonItems([sortButton], animated: true)

  }
  
  func sort() {
    if isSortedAscending {
      categories.sort { $0?.title?.localizedCaseInsensitiveCompare(($1?.title)!) == ComparisonResult.orderedDescending }
      isSortedAscending = false
    } else {
      categories.sort { $0?.title?.localizedCaseInsensitiveCompare(($1?.title)!) == ComparisonResult.orderedAscending }
      isSortedAscending = true
    }
  }
  
  // MARK: - Table view data source
  override func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    // #warning Incomplete implementation, return the number of rows
    return categories.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let category = categories[indexPath.row]
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "Category", for: indexPath)
    cell.textLabel?.text = category?.title
    cell.detailTextLabel?.text = category?.description
    
    return cell
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    tableView.deselectRow(at: indexPath, animated: true)
    
    selectedCategory = indexPath.row == 0 ? "Restaurant" : "Vacation"
    
    self.performSegue(withIdentifier: "CategorySelected", sender: self)
  }

  
  // MARK: - Navigation
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "CategorySelected" {
      let destinationController = segue.destination as! RestaurantsTableViewController
      destinationController.data = selectedCategory == "Restaurant" ? RestaurantsJSONParser.getRecources(forType: "restaurants") : RestaurantsJSONParser.getRecources(forType: "vacation-spot")      
      // Set destination's back bar button item
      let backItem = UIBarButtonItem()
      backItem.title = "Categories"
      navigationItem.backBarButtonItem = backItem
    }
  }
}
