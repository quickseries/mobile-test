//
//  LocationDetails.swift
//  Location
//
//  Created by Nagesh on 25/05/19.
//  Copyright © 2019 Nagesh. All rights reserved.
//

import UIKit

class LocationDetails: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    fileprivate var viewModel:LocationDetailViewModel?
    
    var locations: Location? {
        didSet{
            guard let location = locations else {
                return
            }
            viewModel = LocationDetailViewModel(locationDetails: location)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Location Details"
        guard let viewModel = viewModel else { return }
        tableView.dataSource = viewModel
        tableView.delegate = viewModel
        tableView?.estimatedRowHeight = 180
        tableView?.rowHeight = UITableView.automaticDimension
        tableView?.register(TitleAndDiscriptionCell.nib, forCellReuseIdentifier: LocationDetailTableCells.titleAndDiscriptionCell)
        tableView?.register(ContactInfoCell.nib, forCellReuseIdentifier: LocationDetailTableCells.contactInfoCell)
        tableView?.register(AddressCell.nib, forCellReuseIdentifier: LocationDetailTableCells.addressCell)
        tableView?.register(SocialMediaCell.nib, forCellReuseIdentifier: LocationDetailTableCells.socialMediaCell)
        
        tableView.reloadData()
        
        // Do any additional setup after loading the view.
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
