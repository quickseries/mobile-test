//
//  CategoriesViewController.swift
//  Mobile-Test
//
//  Created by Chris Comeau on 2020-05-19.
//  Copyright © 2020 Skyriser Media. All rights reserved.
//

import UIKit
import SVProgressHUD

class CategoriesViewController: UITableViewController {

    private let viewModel: CategoriesViewModel
    
    required init?(coder: NSCoder) {
		viewModel = CategoriesViewModel()
		super.init(coder: coder)
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		title = Strings.categories
		
		setupNavigationBar()
		setupTableView()
		
		reload()
	}
	
//    override func viewWillAppear(_ animated: Bool) {
//
//	}
	

	private func setupNavigationBar() {
		navigationController?.navigationBar.prefersLargeTitles = true
		navigationController?.navigationBar.tintColor = Constants.textColor
		navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: Constants.textColor]
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


extension CategoriesViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)

		performSegue(withIdentifier: "showResources", sender: indexPath)
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		//guard let category = sender as?  Category else { return }
		
		guard let indexPath = sender as?  IndexPath else { return }
		let category = viewModel.categories[indexPath.row]

		// Create a new variable to store the instance of PlayerTableViewController
		let resourceVC = segue.destination as! ResourcesViewController
		resourceVC.category = category
	}

}


class CategoriesTableViewCell: UITableViewCell {

	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
