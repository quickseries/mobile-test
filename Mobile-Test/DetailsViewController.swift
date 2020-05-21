//
//  DetailsViewController.swift
//  Mobile-Test
//
//  Created by Chris Comeau on 2020-05-21.
//  Copyright © 2020 Skyriser Media. All rights reserved.
//

import Foundation
import UIKit
import SVProgressHUD

class DetailsViewController: UITableViewController {
	
	required init?(coder: NSCoder) {
		super.init(coder: coder)
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		//todo: ccomeau
		title = "Details"
		navigationController?.navigationBar.prefersLargeTitles = true
		
		setupTableView()
		reload()
	}
	
	
	private func setupTableView() {
		tableView.delegate = self
		
		//self.tableView.register(CategoriesTableViewCell.self, forCellReuseIdentifier: String(describing: CategoriesTableViewCell.self))
	}
	
	private func reload() {
		
	}
}

