//
//  CategoriesViewController.swift
//  QuickSeriesTest
//
//  Created by Mgrditch Bajakian on 2017-11-10.
//  Copyright © 2017 Mgrditch Bajakian. All rights reserved.
//

import UIKit

class CategoriesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - Table view data source
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     
        //let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.categoryCellIdentifier.rawValue, for: indexPath) as CategoriesTableViewCell
 
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.categoryCellIdentifier.rawValue, for: indexPath) as? CategoriesTableViewCell  else {
            fatalError("The dequeued cell is not an instance of MealTableViewCell.")
        }
        
        cell.titleLabel.text = "Section " + String(indexPath.section) + " Row " + String(indexPath.row)
        cell.descriptionLabel.text = "This is the detail"
     
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

}
