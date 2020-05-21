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
	// TODO: ccomeau: implement details

	required init?(coder: NSCoder) {
		super.init(coder: coder)
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		title = "Details"
		navigationController?.navigationBar.prefersLargeTitles = true
		
		setupTableView()
		reload()
	}
	
	private func setupTableView() {
		tableView.delegate = self
	}
	
	private func reload() {
		
	}
}
