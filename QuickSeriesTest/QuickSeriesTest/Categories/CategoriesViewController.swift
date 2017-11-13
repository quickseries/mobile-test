//
//  CategoriesViewController.swift
//  QuickSeriesTest
//
//  Created by Mike Bajakian on 2017-11-10.
//  Copyright © 2017 Mike Bajakian. All rights reserved.
//

import UIKit

class CategoriesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    //-----------------------------------------------------------------------------------------------------------------
    // MARK: - globals
    var categoriesArray = Array<Dictionary<String, Any>>()
    var viewIsInErrorMode = false
    var selectedCategoryIndex = -1



    //-----------------------------------------------------------------------------------------------------------------
    // MARK: - view lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = ViewTitles.categories.rawValue
        
        // init data source
        loadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    //-----------------------------------------------------------------------------------------------------------------
    // MARK: - tableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoriesArray.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.categoryCellIdentifier.rawValue, for: indexPath) as? CategoriesTableViewCell  else {
            fatalError("CategoriesViewController: cellForRowAtIndexPath: The dequeued cell is not an instance of CategoriesTableViewCell.")
        }
        
        if let categoryTitle = categoriesArray[indexPath.row][KeyValues.titleKeyValue.rawValue] as? String {
            cell.titleLabel.text = categoryTitle
        }
        else {
            cell.titleLabel.text = "Unknown category"
        }
        
        if let descriptionTitle = categoriesArray[indexPath.row][KeyValues.descriptionKeyValue.rawValue] as? String {
            cell.descriptionLabel.text = descriptionTitle
        }
        
        if viewIsInErrorMode {
            cell.titleLabel.textColor = UIColor.red
            cell.descriptionLabel.textColor = UIColor.red
            cell.isUserInteractionEnabled = false
        }
     
        return cell
     }
    
    
    //-----------------------------------------------------------------------------------------------------------------
    // MARK: - tableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //deselect the selected row
        tableView.deselectRow(at: indexPath, animated: true)
        
        selectedCategoryIndex = indexPath.row
        
        performSegue(withIdentifier: SegueIdentifiers.resourcesListSegueIdentifier.rawValue, sender: nil)
    }
    
    
    
    //-----------------------------------------------------------------------------------------------------------------
    // MARK: - data model
    func loadData() {
        if let filePath = Bundle.main.path(forResource: FileNames.categoriesFileName.rawValue, ofType: FileTypes.jsonFileType.rawValue) {
            do {
                let dataFromFile = try Data(contentsOf: URL(fileURLWithPath: filePath), options: .mappedIfSafe)
                
                let jsonFromData = try JSONSerialization.jsonObject(with: dataFromFile, options: .mutableContainers)
                
                if let jsonArray = jsonFromData as? Array<Dictionary<String, Any>> {

                    // populate the datasource
                    categoriesArray = jsonArray
                }
                else {
                    // handle error
                    setViewInErrorMode()
                }
            }
            catch {
                // handle error
                setViewInErrorMode()
            }
        }
        else {
            // handle error
            setViewInErrorMode()
        }
    }
    

    //-----------------------------------------------------------------------------------------------------------------
    // MARK: - error handling
    func setViewInErrorMode() {
        viewIsInErrorMode = true
        // initialize the data source to a single entry that shows an errror message
        categoriesArray = [[KeyValues.titleKeyValue.rawValue: "ERROR IN VIEW", KeyValues.descriptionKeyValue.rawValue: "Please debug to identify error"]]
    }

    

    //-----------------------------------------------------------------------------------------------------------------
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == SegueIdentifiers.resourcesListSegueIdentifier.rawValue {
            let resourcesListTableViewController = segue.destination as! ResourcesListTableViewController
            resourcesListTableViewController.resourceListFileNameIndex =  selectedCategoryIndex
        }
    }
}






