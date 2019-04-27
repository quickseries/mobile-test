//
//  ViewController.swift
//  Assignment
//
//  Created by Syed Hashmi on 4/26/19.
//  Copyright © 2019 QuickSeries. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
class StoryBoardConstants {
    public static let segueCategoriesSpots = "segue_categories_spots"
    public static let SegueCategoriesRestaurants = "segue_categories_restaurants"
    public static let ResourceDetailViewController_StoryBoardId = "ResourceDetailViewController"
}
class CategoryListViewController: UIViewController {
//    var isFetching: Driver<Bool> {
//        return _isFetching.asDriver()
//    }
    private var selectedCategoryViewViewModel:CategoryViewViewModel?
    private let _JSONfileName = BehaviorRelay<String>(value: "categories")
    var JSONfileName: Driver<String> {
        return _JSONfileName.asDriver()
    }
    @IBOutlet weak var listTableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var errorLabel: UILabel!
    var categoryListViewViewModel: CategoryListViewViewModel!
    let disposeBag = DisposeBag()
   /* override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        DataStore.shared.fetchCategories(fromFile: "categories", successHandler: { (categoriesModelArr) in
            print(categoriesModelArr)
            
        }) { (error) in
            print(error)
        }
    }*/
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        categoryListViewViewModel = CategoryListViewViewModel(fileName: JSONfileName, dataStore: DataStore.shared)
        categoryListViewViewModel.categories.drive(onNext: {[unowned self] (_) in
            self.listTableView.reloadData()
        }).disposed(by: disposeBag)
        
        
        categoryListViewViewModel.isFetching.drive(activityIndicator.rx.isAnimating)
            .disposed(by: disposeBag)
        
        
        categoryListViewViewModel.error.drive(onNext: {[unowned self] (error) in
            self.errorLabel.isHidden = !self.categoryListViewViewModel.hasError
            self.errorLabel.text = error
        }).disposed(by: disposeBag)
        
        setupTableView()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == StoryBoardConstants.segueCategoriesSpots {
            if let destinationVC = segue.destination as? SpotListViewController, let selectedCategoryViewViewModel = self.selectedCategoryViewViewModel{
                destinationVC.categoryType = .kVacationSpot
                destinationVC.categoryEID = selectedCategoryViewViewModel.eid
            }
        }
        if segue.identifier == StoryBoardConstants.SegueCategoriesRestaurants {
            if let destinationVC = segue.destination as? SpotListViewController,let selectedCategoryViewViewModel = self.selectedCategoryViewViewModel{
                destinationVC.categoryType = .kRestaurant
                destinationVC.categoryEID = selectedCategoryViewViewModel.eid
            }
        }
        
    }
    private func setupTableView() {
        listTableView.tableFooterView = UIView()
        listTableView.rowHeight = UITableView.automaticDimension
        listTableView.estimatedRowHeight = 100
        listTableView.register(UINib(nibName: "CategoryCell", bundle: nil), forCellReuseIdentifier: "CategoryCell")
    }

}

extension CategoryListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryListViewViewModel.numberOfCategories
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath) as! CategoryCell
        if let viewModel =
        categoryListViewViewModel.viewModelForCategory(at: indexPath.row){
            cell.configure(viewModel: viewModel)
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if let viewModel =
            categoryListViewViewModel.viewModelForCategory(at: indexPath.row){
            selectedCategoryViewViewModel = viewModel
            if viewModel.categoryType == .kVacationSpot{
                self.performSegue(withIdentifier: StoryBoardConstants.segueCategoriesSpots, sender: self)
            }
            else if viewModel.categoryType == .kRestaurant{
                self.performSegue(withIdentifier: StoryBoardConstants.SegueCategoriesRestaurants, sender: self)
                
            }
        
            
            
        }
    }
}
