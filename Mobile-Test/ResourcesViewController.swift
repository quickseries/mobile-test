//
//  ResourcesViewController.swift
//  Mobile-Test
//
//  Created by Chris Comeau on 2020-05-19.
//  Copyright © 2020 Skyriser Media. All rights reserved.
//

import Foundation
import UIKit
import SVProgressHUD

class ResourcesViewController: UITableViewController {

    private let viewModel: ResourcesViewModel
    
	var category: Category? {
		didSet {
			title = category?.title
			viewModel.category = category
		}
	}

    required init?(coder: NSCoder) {
		viewModel = ResourcesViewModel()
		super.init(coder: coder)
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		navigationController?.navigationBar.prefersLargeTitles = true

		setupTableView()
		reload()
	}

	
	private func setupTableView() {
		tableView.delegate = self
		tableView.dataSource = viewModel

		self.tableView.register(CategoriesTableViewCell.self, forCellReuseIdentifier: String(describing: CategoriesTableViewCell.self))
    }
	
	private func reload() {
		SVProgressHUD.show()
		
		viewModel.fetch() { result in
			
			DispatchQueue.main.async {
				SVProgressHUD.dismiss()
				switch result {
				  case .success:
					self.tableView.reloadData()
				  
				  case .failure(let error):
					self.showAlert(title: Strings.error, message: error.message ?? error.kind.rawValue)
				}
			}
		}
	}
}

extension ResourcesViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)

		performSegue(withIdentifier: "showDetails", sender: indexPath)
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		guard let indexPath = sender as?  IndexPath else { return }
		let resource = viewModel.resources[indexPath.row]
		// Create a new variable to store the instance of PlayerTableViewController
//		let resourceVC = segue.destination as! ResourcesViewController
//		resourceVC.category = category
	}
}

class ResourcesTableViewCell: UITableViewCell {

	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

