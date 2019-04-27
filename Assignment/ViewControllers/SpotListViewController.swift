//
//  SpotListViewController.swift
//  Assignment
//
//  Created by Syed Hashmi on 4/26/19.
//  Copyright © 2019 QuickSeries. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
class SpotListViewController: UIViewController {
    var categoryType : categoryType = .none
    var categoryEID : String = ""
    @IBOutlet weak var listTableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var errorLabel: UILabel!
    @IBAction func sortButtonAction(_ sender: Any) {
        guard let spotListViewViewModel = spotListViewViewModel else{
            return
        }
        spotListViewViewModel.fetchSortedSpotsFromDB(categoryEID: categoryEID)
    }

    var spotListViewViewModel: SpotListViewViewModel?
    let disposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if self.categoryType == .kRestaurant{
            self.title = "Restaurants"
            let JSONfileName = BehaviorRelay<String>(value: "restaurants")
            self.spotListViewViewModel = SpotListViewViewModel(fileName: JSONfileName.asDriver(), dataStore: DataStore.shared)
        }
        else if categoryType == .kVacationSpot{
            self.title = "Vacation Spots"
            let JSONfileName = BehaviorRelay<String>(value: "vacation-spot")
            self.spotListViewViewModel = SpotListViewViewModel(fileName: JSONfileName.asDriver(), dataStore: DataStore.shared)
        }
        guard let spotListViewViewModel = self.spotListViewViewModel else {
            return
        }
        spotListViewViewModel.spots.drive(onNext: {[unowned self] (_) in
            self.listTableView.reloadData()
        }).disposed(by: disposeBag)
        
        
        spotListViewViewModel.isFetching.drive(activityIndicator.rx.isAnimating)
            .disposed(by: disposeBag)
        
        
        spotListViewViewModel.error.drive(onNext: {[unowned self] (error) in
            self.errorLabel.isHidden = !spotListViewViewModel.hasError
            self.errorLabel.text = error
        }).disposed(by: disposeBag)
        
        setupTableView()
    }
    private func setupTableView() {
        listTableView.tableFooterView = UIView()
        listTableView.rowHeight = UITableView.automaticDimension
        listTableView.estimatedRowHeight = 100
        listTableView.register(UINib(nibName: "SpotCell", bundle: nil), forCellReuseIdentifier: "SpotCell")
    }
    
}

extension SpotListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let spotListViewViewModel = self.spotListViewViewModel else {
            return 0
        }
        return spotListViewViewModel.numberOfSpots
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SpotCell", for: indexPath) as! SpotCell
        guard let spotListViewViewModel = self.spotListViewViewModel else {
            return UITableViewCell()
        }
        if let viewModel =
            spotListViewViewModel.viewModelForSpot(at: indexPath.row){
            cell.configure(viewModel: viewModel)
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let spotListViewViewModel = self.spotListViewViewModel else {
            return
        }
        let vc:ResourceDetailViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: StoryBoardConstants.ResourceDetailViewController_StoryBoardId) as! ResourceDetailViewController

        vc.resourceDetailViewViewModel = spotListViewViewModel.resourceDetailViewViewModelForSpot(at: indexPath.row)

        self.navigationController?.pushViewController(vc, animated: true)
    }
}
