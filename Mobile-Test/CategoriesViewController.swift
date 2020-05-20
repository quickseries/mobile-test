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
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		// Create a variable that you want to send
		//var newProgramVar = Program(category: "Some", name: "Text")

		guard let category = sender as?  Category else { return }
		
		// Create a new variable to store the instance of PlayerTableViewController
		let resourceVC = segue.destination as! ResourcesViewController
		resourceVC.category = category
	}

	private func setupNavigationBar() {
		navigationController?.navigationBar.prefersLargeTitles = true
		navigationController?.navigationBar.tintColor = Constants.textColor
		navigationController?.navigationBar.barTintColor = Constants.backgroundColor
		navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: Constants.textColor]
		
		//https://stackoverflow.com/questions/56556254/in-ios13-the-status-bar-background-colour-is-different-from-the-navigation-bar-i/57152709#57152709
		let navBarAppearance = UINavigationBarAppearance()
		navBarAppearance.configureWithOpaqueBackground()
		navBarAppearance.titleTextAttributes = [.foregroundColor: Constants.textColor]
		navBarAppearance.largeTitleTextAttributes = [.foregroundColor: Constants.textColor]
		navBarAppearance.backgroundColor = Constants.backgroundColor
		navigationController?.navigationBar.standardAppearance = navBarAppearance
		navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
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

		let category = viewModel.categories[indexPath.row]
		
		//let resourceViewController = ResourcesViewController()
		
		performSegue(withIdentifier: "showResources", sender: category)

		switch category.type {
		case .restaurant:
			//navigationController?.pushViewController(resourceViewController, animated: yes)
			break
			
		case .vacationSpot:
			//navigationController?.pushViewController(resourceViewController, animated: yes)
			break
		}
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
