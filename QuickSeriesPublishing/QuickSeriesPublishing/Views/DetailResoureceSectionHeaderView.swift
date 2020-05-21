//
//  DetailResoureceSectionHeaderView.swift
//  QuickSeriesPublishing
//
//  Created by Tony Tran on 2020-05-22.
//  Copyright © 2020 quickseries. All rights reserved.
//

import UIKit

class DetailResoureceSectionHeaderView: UITableViewHeaderFooterView {

    @IBOutlet weak var title: UILabel!
    
    func updateHeaderView(_ text: String) {
        title.text = text
    }

}
