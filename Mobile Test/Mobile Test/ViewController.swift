//
//  ViewController.swift
//  Mobile Test
//
//  Created by Alecu Truica on 5/18/19.
//  Copyright © 2019 Alecu Truica. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var categoriesTableView: UITableView!
    
    var categories: [Category] = []
    var categoryEid: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        categoriesTableView.dataSource = self
        categoriesTableView.delegate = self
        categoriesTableView.rowHeight = 80
        
        guard let categoriesURL = URL(string: "https://raw.githubusercontent.com/unboeing/mobile-test/master/data/categories.json") else {
            print("invalid categories url")
            return
        }
        URLSession.shared.dataTask(with: categoriesURL) { (data, response, error) in
            guard let data = data else {
                print("Error with URLSession.dataTask", error!.localizedDescription)
                return
            }
            do {
                self.categories = try JSONDecoder().decode([Category].self, from: data)
                DispatchQueue.main.async {
                    for category in self.categories {
                        if GlobalVariables.sharedManager.restaurantsEid == "" {
                            if category.id == "59839fd7951cf747207bed3e" {
                                GlobalVariables.sharedManager.restaurantsEid = category.eid
                            }
                        }
                        if GlobalVariables.sharedManager.vacationSpotsEid == "" {
                            if category.id == "5983a2b7951cf747207bed41" {
                                GlobalVariables.sharedManager.vacationSpotsEid = category.eid
                            }
                        }
                    }
                    self.categoriesTableView.reloadData()
                }
            } catch {
                print(error.localizedDescription)
            }
            }.resume()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "resourcesSegue" {
            let destination = segue.destination as! ResourcesViewController
            destination.categoryEid = categoryEid
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = categoriesTableView.dequeueReusableCell(withIdentifier: "categoryCell") as! CategoryCell
        cell.categoryToDisplay = categories[indexPath.row]
        cell.resourcesCellButton.accessibilityHint = categories[indexPath.row].eid
        cell.resourcesCellButton.addTarget(self, action: #selector(resourcesCellButtonTapped(sender:)), for: .touchUpInside)
        return cell
    }
    
    @IBAction func resourcesCellButtonTapped(sender: UIButton) {
        categoryEid = sender.accessibilityHint!
        self.performSegue(withIdentifier: "resourcesSegue", sender: self)
    }
}

