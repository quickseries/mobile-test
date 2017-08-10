//
//  ResourceTableViewController.swift
//  Test
//
//  Created by Roger Francoeur on 17-08-10.
//  Copyright © 2017 Roger Francoeur. All rights reserved.
//

import UIKit

class ResourceTableViewController: UITableViewController {
    
    var category : CategoryType?
    var ascending = false
    var resourceList = [Resource]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Set the view title
        self.navigationItem.title = "RESOURCES"
        
        // Add sorting button to navigation
        let sortButtonItem = UIBarButtonItem.init(
            title: "Sort",
            style: .plain,
            target: self,
            action: #selector(rightButtonAction)
        )
        self.navigationItem.rightBarButtonItem = sortButtonItem;
        
        // Parse the categories from Json
        guard let category = category else {
            return
        }
        readResourcesFromJson(category)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return resourceList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "resourceCell", for: indexPath)
        
        // Configure the cell...
        cell.textLabel?.text = resourceList[indexPath.row].title
        
        return cell
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
     
     
    }
    */
    
    // MARK: - Private
    
    @objc private func rightButtonAction(){
        filterList()
    }
    
    func filterList() {
        
    }
    
    private func readResourcesFromJson(_ resourceType: CategoryType) {
        
        do {
            if let file = Bundle.main.url(forResource: resourceType.rawValue, withExtension: "json", subdirectory: "data") {
                let data = try Data(contentsOf: file)
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                if let object = json as? [Any] {
                    
                    // Json is an array
                    for eachRessource in object {
                        resourceList.append(Resource(eachRessource as! [String: Any]))
                    }
                    
                } else {
                    print("JSON is invalid")
                }
            } else {
                print("No file")
            }
        } catch {
            print(error.localizedDescription)
        }

    }
    
}

// MARK: - Structure
struct Resource {
    let id: String?
    let slug: String?
    let title: String?
    let description: String?
    let photo: String?
    
    init(_ dict: [String: Any]) {
        
        id = dict["_id"] as? String ?? ""
        slug = dict["slug"] as? String ?? ""
        title = dict["title"] as? String ?? ""
        description = dict["description"] as? String ?? ""
        photo = dict["photo"] as? String ?? ""
        
    }
}

