//
//  ResourceDetailViewController.swift
//  QSMobileTest
//
//  Created by Munib Siddiqui on 20/05/2019.
//  Copyright © 2019 Munib Siddiqui. All rights reserved.
//

import UIKit
import Former

class ResourceDetailViewController: FormViewController {

    
    var resourceDetailVM: ResourceDetailViewModel?
    var resource: Resource?


    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = resource?.title
        tableView.estimatedRowHeight = 600

        resourceDetailVM = ResourceDetailViewModel(resource: resource, former: former)
        resourceDetailVM?.configureCell()
        
    }

    
    
}
