//
//  CategoryListViewController.swift
//  InterviewApp
//
//  Created by Georgi Popov on 2017-10-12.
//  Copyright © 2017 none. All rights reserved.
//

import UIKit

class ResourcesListViewController : GenericViewController {
    enum Sort {
        case none
        case a_z
        case z_a
        
        func next() -> Sort {
            switch self {
            case .none:
                return .a_z
            case .a_z:
                return .z_a
            case .z_a:
                return .none
            }
        }
        
        func display() -> String{
            switch self {
            case .none:
                return "Sort"
            case .a_z:
                return "A-z"
            case .z_a:
                return "Z-a"
            }
        }
    }
    
    var resourcesList : [[String : Any]] = []
    var resourcesListInitial : [[String : Any]] = []
    var titleString: String = ""
    var sort : Sort = .none
    @IBOutlet weak var resourcesTable: UITableView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var sortBtn: UIButton!
    
    @IBAction func unwindToResourcesListViewController(segue:UIStoryboardSegue) { }

    @IBAction func sortBtnAction(_ sender: Any) {
        let newSort = sort.next()
        sort(newSort)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.resourcesList = self.resourcesListInitial
        self.resourcesTable.delegate = self
        self.resourcesTable.dataSource = self
        self.resourcesTable.tableFooterView = UIView()
        self.titleLabel.text = titleString
        sort(.none)
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "resource" {
            if let vc = segue.destination as? ResourceViewController {
                if let index = sender as? Int {
                    vc.resource = resourcesList[index]
                }
            }
        }
    }
    
    func sort(_ sortOrder:Sort) {
        switch sortOrder {
        case .none:
            resourcesList = resourcesListInitial
        case .a_z:
            resourcesList = resourcesListInitial.sorted(by: { $1["title"] as! String > $0["title"] as! String })
        case .z_a:
            resourcesList = resourcesListInitial.sorted(by: { $0["title"] as! String > $1["title"] as! String })
        }
        sort = sortOrder
        self.sortBtn.setTitle(sort.display(), for: .normal)
        resourcesTable.reloadData()
    }
}

extension ResourcesListViewController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.resourcesList.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let resource = self.resourcesList[indexPath.row]
        if resource["description"] as? String != nil{
            return Constants.CELL_HEIGHT_LARGE
        }
        
        return Constants.CELL_HEIGHT_SMALL
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell") as? CategoryCell {
            let resource = self.resourcesList[indexPath.row]
            if let title = resource["title"] as? String{
                cell.categoryNameLabel.text = title
            }
            if let description = resource["description"] as? String{
//                If we want to use the HTML and not block the UI
//                DispatchQueue.global(qos: .background).async {
//                    let attrStrDescription = description.htmlToAttributedString
//                    DispatchQueue.main.async {
//                        cell.categoryDescriptionLabel.attributedText = attrStrDescription
//                        cell.categoryDescriptionLabel.isHidden = false
//                    }
//                }
                cell.categoryDescriptionLabel.text = description.htmlToString
                cell.categoryDescriptionLabel.isHidden = false
            } else {
                cell.categoryDescriptionLabel.isHidden = true
            }
            return cell
        }
        
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true )
        performSegue(withIdentifier: "resource", sender: indexPath.row)

    }
}

