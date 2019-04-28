//
//  BusinessHoursViewController.swift
//  QuickSeries
//
//  Created by Ramiz Rafiq on 4/24/19.
//  Copyright © 2019 Ramiz Rafiq. All rights reserved.
//

import UIKit

class BusinessHoursViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tblBusiness:UITableView!
    
    var businessHour:bizHours?
    fileprivate var arrContacts = NSArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tblBusiness.dequeueReusableCell(withIdentifier: "ids_BusinessHours") as! BizHourCell
        
        
        if indexPath.row == 0
        {
            guard let bizObj = businessHour?.sunday
            else { return UITableViewCell() }
           
            cell.setupTable(title: "Sunday", timing:bizObj )
         
        }
        else if indexPath.row == 1
        {
            guard let bizObj = businessHour?.monday
            else { return UITableViewCell() }
            
            cell.setupTable(title: "Monday", timing:bizObj )

        }
        else if indexPath.row == 2
        {
            guard let bizObj = businessHour?.tuesday
            else { return UITableViewCell() }
            
            cell.setupTable(title: "Tuesday", timing:bizObj )
        }
        else if indexPath.row == 3
        {
            guard let bizObj = businessHour?.wednesday
            else { return UITableViewCell() }
            
            cell.setupTable(title: "Wednesday", timing:bizObj )
        }
        else if indexPath.row == 4
        {
            guard let bizObj = businessHour?.thursday
            else { return UITableViewCell() }
            
            cell.setupTable(title: "Thursday", timing:bizObj )
        }
        else if indexPath.row == 5
        {
            guard let bizObj = businessHour?.friday
            else { return UITableViewCell() }
            
            cell.setupTable(title: "Friday", timing:bizObj )
        }
            
        else if indexPath.row == 6
        {
            guard let bizObj = businessHour?.sunday
            else { return UITableViewCell() }
            
            cell.setupTable(title: "Saturday", timing:bizObj )
        }

        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 7
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.row == 0
        {
            guard let _ = businessHour?.sunday?.to
            else { return 0 }
        }
        else if indexPath.row == 1
        {
            guard let _ = businessHour?.monday?.to
                else { return 0 }
        }
        else if indexPath.row == 2
        {
            guard let _ = businessHour?.tuesday?.to
                else { return 0 }
        }
        else if indexPath.row == 3
        {
            guard let _ = businessHour?.wednesday?.to
                else { return 0 }
        }
        else if indexPath.row == 4
        {
            guard let _ = businessHour?.thursday?.to
                else { return 0 }
        }
        else if indexPath.row == 5
        {
            guard let _ = businessHour?.friday?.to
                else { return 0 }
        }
        else if indexPath.row == 6
        {
            guard let _ = businessHour?.sunday?.to
                else { return 0 }
        }
        

        return 50
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
