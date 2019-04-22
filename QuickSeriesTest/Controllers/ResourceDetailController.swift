//
//  ResourceDetailController.swift
//  QuickSeriesTest
//
//  Created by Mathieu Massicotte on 2019-04-20.
//  Copyright © 2019 Via Logica Inc. All rights reserved.
//

import UIKit

class ResourceDetailController: UITableViewController {
    var resource: ResourceDetails = [:]
    lazy var dataSource = ResourceDetailDataSource(withResourceDetails: resource)
    @IBOutlet weak var headerImage: UIImageView!
    @IBOutlet weak var headerTitle: UILabel!
    @IBOutlet weak var headerSubtitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = dataSource
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 80
        if let title = dataSource.resourceDetails?[ResourceDetailKey.title.description] as? String,
            let subtitle = dataSource.resourceDetails?[ResourceDetailKey.description.description] as? String {
            self.headerTitle.text? = title
            self.headerSubtitle.text? = subtitle.htmlToString
        }
        if let urlString = dataSource.resourceDetails?[ResourceDetailKey.photo.description] as? String {
            ImageFetcher.imageFromURL(withString: urlString, forImageView: self.headerImage)
        }
    }
    
     // MARK: - Table View Delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let key = self.dataSource.contactKeys?[indexPath.row], let contact = self.dataSource.contacts?[key] {
            if key.lowercased() == "website", let url = contact.first {
                if let url = URL(string: url)
                {
                    UIApplication.shared.open(url)
                }
            } 
        }
    }
}
