//
//  ResourcesListTableViewController.swift
//  QuickSeriesTest
//
//  Created by Mike Bajakian on 2017-11-11.
//  Copyright © 2017 Mike Bajakian. All rights reserved.
//

import UIKit

class ResourcesListTableViewController: UITableViewController {
    
    //-----------------------------------------------------------------------------------------------------------------
    // MARK: - globals
    var resourcesListArray = Array<Dictionary<String, Any>>()
    var resourceListFileNameIndex = -1
    var viewIsInErrorMode = false
    var sortButton = UIBarButtonItem()
    var currentSortStatus = sortingStatus.unsorted
    var selectedResourceIndex = -1


    //-----------------------------------------------------------------------------------------------------------------
    // MARK: - view lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // init sort
        initSorting()
        
        // init data source
        loadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    //-----------------------------------------------------------------------------------------------------------------
    // MARK: - sorting
    func initSorting() {
        // initially the list is considered unsorted
        currentSortStatus = sortingStatus.unsorted
        sortButton = UIBarButtonItem(title: sortButtonTitles.alphabeticallyIncreasing.rawValue, style: .plain, target: self, action: #selector(ResourcesListTableViewController.sortButtonTapped(_:)))
        self.navigationItem.rightBarButtonItem = sortButton
    }
    
    
    @objc func sortButtonTapped(_ sender:UIBarButtonItem!) {
        //sort the list based on current sort status
        switch currentSortStatus {
            case .unsorted, .sortedZtoA:
                currentSortStatus = sortingStatus.sortedAtoZ
                sortButton.title = sortButtonTitles.alphabeticallyDecreasing.rawValue
                resourcesListArray = resourcesListArray.sorted(by: { ($0[KeyValues.titleKeyValue.rawValue] as! String) < ($1[KeyValues.titleKeyValue.rawValue] as! String) })

            case .sortedAtoZ:
                currentSortStatus = sortingStatus.sortedZtoA
                sortButton.title = sortButtonTitles.alphabeticallyIncreasing.rawValue
                resourcesListArray = resourcesListArray.sorted(by: { ($0[KeyValues.titleKeyValue.rawValue] as! String) > ($1[KeyValues.titleKeyValue.rawValue] as! String) })
        }
        
        self.tableView.reloadData()
    }
    

    
    //-----------------------------------------------------------------------------------------------------------------
    // MARK: - tableViewDataSource
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resourcesListArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.resourceListCellIdentifier.rawValue, for: indexPath) as? ResourcesListTableViewCell  else {
            fatalError("ResourcesListTableViewController: cellForRowAtIndexPath: The dequeued cell is not an instance of ResourcesListTableViewCell.")
        }
        
        
        if viewIsInErrorMode {
            cell.resourceTitleLabel.textColor = UIColor.red
            cell.resourceImage.image = UIImage(named: imageNames.imageViewPlaceHolder.rawValue)
            cell.isUserInteractionEnabled = false
        }
        else {
            if let resourceTitle = resourcesListArray[indexPath.row][KeyValues.titleKeyValue.rawValue] as? String {
                cell.resourceTitleLabel.text = resourceTitle
            }
            else {
                cell.resourceTitleLabel.text = "Unknown"
            }
            
            // initially set the placeholder image
            cell.resourceImage.image = UIImage(named: imageNames.imageViewPlaceHolder.rawValue)
            
            // load the actual image asynchronously
            if let imagePath = resourcesListArray[indexPath.row][KeyValues.photoKeyValue.rawValue] as? String {
                let url = URL(string: imagePath)!
                let request = NSMutableURLRequest(url: url)
                let task = URLSession.shared.dataTask(with: request as URLRequest) {
                    data, response, error in
                    if error != nil {
                        //Note: if image loading fails, implement any relevant app UX policy
                        //      current policy: keeps placeholder image
                        print(error!)
                    }
                    else {
                        DispatchQueue.main.async(execute: {
                            cell.resourceImage.image = UIImage(data: data!)
                        })
                    }
                }
                task.resume()
            }
        }
        
        return cell
    }

    
    //-----------------------------------------------------------------------------------------------------------------
    // MARK: - tableViewDelegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //deselect the selected row
        tableView.deselectRow(at: indexPath, animated: true)
        
        selectedResourceIndex = indexPath.row
        
        performSegue(withIdentifier: SegueIdentifiers.detailViewSegueIdentifier.rawValue, sender: nil)
    }

    

    //-----------------------------------------------------------------------------------------------------------------
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == SegueIdentifiers.detailViewSegueIdentifier.rawValue {
            let detailViewController = segue.destination as! DetailViewController
            detailViewController.resourceDetailsDictionary = resourcesListArray[selectedResourceIndex] as Dictionary
        }
    }


    
    //-----------------------------------------------------------------------------------------------------------------
    // MARK: - data model
    func loadData() {
        
        //make sure only possible category lists are selected
        var resourceListFileName = ""
        switch resourceListFileNameIndex {
            case 0:
                resourceListFileName = FileNames.restaurantsFileName.rawValue
                self.navigationItem.title = ViewTitles.restaurants.rawValue
            case 1:
                resourceListFileName = FileNames.vacationSpotsFileName.rawValue
                self.navigationItem.title = ViewTitles.vacationSpots.rawValue
            default:
                // handle error
                setViewInErrorMode()
                return
        }

        if let filePath = Bundle.main.path(forResource: resourceListFileName, ofType: FileTypes.jsonFileType.rawValue) {
            do {
                let dataFromFile = try Data(contentsOf: URL(fileURLWithPath: filePath), options: .mappedIfSafe)
                
                let jsonFromData = try JSONSerialization.jsonObject(with: dataFromFile, options: .mutableContainers)
                
                if let jsonArray = jsonFromData as? Array<Dictionary<String, Any>> {
                    
                    // populate the datasource
                    resourcesListArray = jsonArray
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
        self.navigationItem.title = "ERROR"
        sortButton.isEnabled = false
        
        // initialize the data source to a single entry that shows an errror message
        resourcesListArray = [[KeyValues.titleKeyValue.rawValue: "ERROR IN VIEW"]]
    }
}





