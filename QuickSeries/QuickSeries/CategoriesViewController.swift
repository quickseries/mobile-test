//
//  ViewController.swift
//  QuickSeries
//
//  Created by Ramiz Rafiq on 4/24/19.
//  Copyright © 2019 Ramiz Rafiq. All rights reserved.
//

import UIKit
import RealmSwift

class CategoriesViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet fileprivate weak var tblCategories:UITableView!
    fileprivate var arrCategories:Results<Categories>?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        arrCategories = DataManager.getCategories(filter: "_active == 1")
    }


}

extension CategoriesViewController
{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tblCategories.dequeueReusableCell(withIdentifier: "idcell_Category") as! CategoryCell
        
        cell.setupName(categoryObj: arrCategories?[indexPath.row] ?? Categories())
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return arrCategories?.count ?? 0
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let categoryObj = arrCategories?[indexPath.row] as? Categories
        else { return }
        
        Utils.getResourceData(resourceName: "vacation-spot")
        Utils.getResourceData(resourceName: "restaurants")

        guard let resourceView = self.storyboard?.instantiateViewController(withIdentifier: "ResourceView") as? ResourcesViewController
        else { return }
        resourceView.eid = categoryObj.eid
        resourceView.headerTitle = categoryObj.title
        self.navigationController?.pushViewController(resourceView, animated: true)
    }
}

