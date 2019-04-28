//
//  ResourceDetailTableViewController.swift
//  QuickSeries
//
//  Created by Ramiz Rafiq on 4/24/19.
//  Copyright © 2019 Ramiz Rafiq. All rights reserved.
//

import UIKit
import SDWebImage

class ResourceDetailTableViewController: UITableViewController {
    
    @IBOutlet weak var lblTitle:UILabel!
    @IBOutlet weak var lblDescription:UILabel!
    @IBOutlet weak var resourceImage:UIImageView!

    var resourceObj:Resources?
    var contactController:ContactViewController?
    var businessHourController:BusinessHoursViewController?
    var addressController:AddressViewController?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        if resourceObj != nil
        {
            setupResouceData(resourceObj: resourceObj!)
        }
        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    func setupResouceData(resourceObj:Resources)
    {
        lblTitle.text = resourceObj.title
        lblDescription.text = resourceObj.cat_description.getFormattedString()?.string
        
        contactController?.contactObj = resourceObj.contactInfo
        addressController?.arrAddress = resourceObj.arrAddresses
        businessHourController?.businessHour = resourceObj.bizHours
        
        perform(#selector(reload), with: nil, afterDelay: 0.05)

        if resourceObj.photo.count > 0
        {
            resourceImage.sd_setImage(with: URL(string: resourceObj.photo))
        }
        
    }
    @objc func reload()
    {
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 5
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.row == 0
        {
            guard let _ = resourceObj?.photo
            else{ return 0 }
            
            return 150
        }
        if indexPath.row == 2
        {
            guard let _ = resourceObj?.contactInfo
            else { return 0 }
            
            return contactController?.tblContact.contentSize.height ?? 0
        }
        else if indexPath.row == 3
        {
            guard let addressObj = resourceObj?.arrAddresses
            else { return 0 }
            if addressObj.isEmpty
            { return  0 }
            
            return addressController?.tblAddress.contentSize.height ?? 0
        }
        else if indexPath.row == 4
        {
            guard let _ = resourceObj?.bizHours
            else { return 0 }
            
            return businessHourController?.tblBusiness.contentSize.height ?? 0
        }
        
        return UITableView.automaticDimension
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == "contactSegue") {
            contactController = segue.destination as? ContactViewController
        }
        else if segue.identifier == "businessHourSegue"
        {
            businessHourController = segue.destination as? BusinessHoursViewController
        }
        else if segue.identifier == "addressSegue"
        {
            addressController = segue.destination as? AddressViewController
        }
    }


    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
