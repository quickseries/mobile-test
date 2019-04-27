//
//  CategoryListViewController.swift
//  QuickSeries
//
//  Created by Ramiz Rafiq on 4/24/19.
//  Copyright © 2019 Ramiz Rafiq. All rights reserved.
//

import UIKit
import RealmSwift

class ResourcesViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    
    @IBOutlet fileprivate weak var tblResources:UITableView!
    @IBOutlet weak var lblTitle:UILabel!
    
    var eid = ""
    var headerTitle:String?
    var arrResources:Results<Resources>?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        lblTitle.text = headerTitle

        arrResources = DataFetchLayer.getResources(filterItem: eid,sorted: true)
        tblResources.reloadData()
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
extension ResourcesViewController
{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tblResources.dequeueReusableCell(withIdentifier: "idcell_Resource") as! ResourceCell
        
        guard let resourceItem = arrResources?[indexPath.row]
        else { return UITableViewCell() }
        
        cell.setupName(resourceObj: resourceItem)

        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return arrResources?.count ?? 0
    }
    @IBAction func sortArray(sender:UIButton)
    {
        arrResources = DataFetchLayer.getResources(filterItem: eid,sorted: sender.isSelected)
        sender.isSelected = !sender.isSelected
        
        tblResources.reloadData()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let resourceItem = arrResources?[indexPath.row]
            else { return }
        guard let mainView = self.storyboard?.instantiateViewController(withIdentifier: "ResourceDetail") as? ResourceDetailTableViewController
        else { return }
        mainView.resourceObj = resourceItem
        self.navigationController?.pushViewController(mainView, animated: true)
    }
}
