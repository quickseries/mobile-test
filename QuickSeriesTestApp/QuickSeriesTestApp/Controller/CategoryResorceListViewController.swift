//
//  CotegoryViewController.swift
//  QuickSeriesTestApp
//
//  Created by Kasra Abasi on 5/18/19.
//  Copyright © 2019 noxowl. All rights reserved.
//

import UIKit

class CategoryResorceListViewController: UIViewController {
    
    // MARK: - Types
    enum SortType {
        case acendence
        case decendence
    }
    
    // MARK: - Properties
    var category: Category?
    var resourses: [ResourceViewModel] = []
    let mockNetworking = MockNetworking()
    
    
    
    // MARK: - Outlets
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    
    
    // MARK: - Methods
    func sortResourses(sort: SortType) {
        switch sort {
        case .acendence:
            self.resourses.sort{ $0.titleText < $1.titleText}
            self.tableView?.reloadSections(IndexSet(integersIn: 0..<1), with: .fade)
        case .decendence:
            self.resourses.sort{ $0.titleText > $1.titleText}
            self.tableView?.reloadSections(IndexSet(integersIn: 0..<1), with: .fade)
        }
    }
    func updateUI() {
        if let category = category {
            self.title = category.title
            self.descriptionLabel?.text = category.description ?? Constants.Message.noDescription
            mockNetworking.decodeJSON(for: Resource.self, fileName: category.slug) { [weak self] data in
                switch data {
                case let .success(successData):
                    self?.resourses = successData.map{ ResourceViewModel(resource: $0)}
                    self?.sortResourses(sort: .acendence)
                case let .failure(error):
                    print(error)
                }
            }
        }

    }
    
    
    
    // MARK: - Action
    @IBAction func sortSegmentDidChange(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            sortResourses(sort: .acendence)
        case 1:
            sortResourses(sort: .decendence)
        default:
            self.tableView.reloadSections(IndexSet(integersIn: 0..<1), with: .fade)
        }
    }
    
    
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Constants.SegueIdentifier.showResourceDetail {
            if let resourceDetail = (segue.destination.innerViewController as? ResourceDetailViewController) {
                if let cell = sender as? ResoursTableViewCell {
                    resourceDetail.resours = cell.resource
                    resourceDetail.updateUI()
                }
            }
        }
    }
    

}



// MARK: - UITableViewDataSource
extension CategoryResorceListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resourses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: Constants.CellIdentifier.resours, for: indexPath) as? ResoursTableViewCell {
            cell.resource = resourses[indexPath.row]
            return cell
        }
        return UITableViewCell()
    }
}



// MARK: - UITableViewDelegate
extension CategoryResorceListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 88.0
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath as IndexPath, animated: true)
    }
}
