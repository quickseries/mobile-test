//
//  DetailTableViewController.swift
//  mobile-test
//
//  Created by Martin Gyupchanov on 09-08-17.
//  Copyright © 2017 Martin Gyupchanov. All rights reserved.
//

import UIKit

class DetailTableViewController: UITableViewController {
  
  @IBOutlet weak var headerImage: CustomImageView!
  
  var restaurant: Restaurant!
  
    override func viewDidLoad() {
        super.viewDidLoad()
      
      title = restaurant.title
      
      if let photo = restaurant.photo, let url = URL(string: photo){
        headerImage.downloadedFrom(url: url)
      }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return restaurant.allValidProperties.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
      if section == 0 {
        return 1
      } else {
        return restaurant.allValidProperties[section].count
      }
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      var cell: UITableViewCell
      if indexPath.section == 0 {
        cell = tableView.dequeueReusableCell(withIdentifier: "Subtitle", for: indexPath)
        cell.textLabel?.text = restaurant.title
        cell.detailTextLabel?.text = restaurant.description

      } else {
        cell = tableView.dequeueReusableCell(withIdentifier: "Title", for: indexPath)
        let properties = restaurant.allValidProperties[indexPath.section]
        cell.textLabel?.text = properties[indexPath.row]
      }
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
