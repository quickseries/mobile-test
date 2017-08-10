//
//  CategoryTableViewController.swift
//  Test
//
//  Created by Roger Francoeur on 17-08-10.
//  Copyright © 2017 Roger Francoeur. All rights reserved.
//

import UIKit

class CategoryTableViewController: UITableViewController {
    
    var categorieList = [Category]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Set the view title
        self.navigationItem.title = "CATEGORIES"
        
        // Read categories from Json file
        readCategoriesFromJson()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categorieList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        // Configure the cell...
        let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell", for: indexPath)
        
        cell.textLabel?.text = categorieList[indexPath.row].title
        cell.detailTextLabel?.text = categorieList[indexPath.row].description
        
        return cell

    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: - Private
    
    private func readCategoriesFromJson() {
        
        do {
            if let file = Bundle.main.url(forResource: "categories", withExtension: "json", subdirectory: "data") {
                let data = try Data(contentsOf: file)
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                if let object = json as? [Any] {
                    // json is an array
                    for eachCategorie in object {
                        categorieList.append(Category(eachCategorie as! [String: Any]))
                    }
                } else {
                    print("JSON is invalid")
                }
            } else {
                print("no file")
            }
        } catch {
            print(error.localizedDescription)
        }
    }

}

// MARK: - Structure

struct Category {
    let id: String?
    let slug: String?
    let title: String?
    let description: String?
    
    init(_ dict: [String: Any]) {
        id = dict["_id"] as? String ?? ""
        slug = dict["slug"] as? String ?? ""
        title = dict["title"] as? String ?? ""
        description = dict["description"] as? String ?? ""
    }
}



