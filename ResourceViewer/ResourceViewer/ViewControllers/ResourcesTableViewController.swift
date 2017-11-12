//
//  ResourcesTableViewController.swift
//  ResourceViewer
//
//  Created by Tarang Patel on 2017-11-12.
//  Copyright © 2017 Tarang Patel. All rights reserved.
//

import UIKit

class ResourcesTableViewController: UITableViewController {

    let reuseIdentifier = "ResourceCell"
    var viewModel: ResourceVMProtocol!
    var resources: [Resource]? = [] {
        didSet {
         self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Resources"
        
        self.viewModel.isFetchSuccessful.bind { (success) in
            if success {
                self.resources = self.viewModel.resources
            }
            else {
                let alert = UIAlertController(title: "Alert", message: "Data not found", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }
        
        self.viewModel.getResourceList(forCategory: self.viewModel.category?.slug)
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Sort A-Z",
                                                                 style: .done,
                                                                 target: self,
                                                                 action: #selector(sortArray))
    }

    @objc func sortArray() {
        self.resources?.sort(by: { $0.title! < $1.title! })
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Sort Z-A",
                                                                 style: .done,
                                                                 target: self,
                                                                 action: #selector(sortArrayReverse))
    }
    
    @objc func sortArrayReverse() {
        self.resources?.sort(by: { $0.title! > $1.title! })
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Sort A-Z",
                                                                 style: .done,
                                                                 target: self,
                                                                 action: #selector(sortArray))
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        self.resources = nil
    }

}

extension ResourcesTableViewController {
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.resources!.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)

        let resource = self.resources![indexPath.row]
        cell.textLabel?.text = resource.title

        return cell
    }
    
}

extension ResourcesTableViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectedResource = self.resources![indexPath.row]
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyBoard.instantiateViewController(withIdentifier: "ResourcesDetailTableViewController") as? ResourcesDetailTableViewController {
            let vm = ResourcesDetailViewModel(with: selectedResource)
            vc.viewModel = vm
            self.navigationController?.pushViewController(vc, animated: true)
        }
        else {
            print("Resource VC not found")
        }
    }
}
