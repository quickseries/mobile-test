//---------------------------------------------------------------------------------------------------------------------------------------
//  File Name        :   CategoriesViewController
//  Description      :   Controller to manange the categories from data store
//                   :   1. UI    - https://github.com/ratzr15/mobile-test/blob/master/resources_android.png
//                       2. Architecture    - TDD + Clean Swift (http://clean-swift.com)
//  Author            :  Rathish Kannan
//  E-mail            :  rathishnk@hotmail.co.in
//  Dated             :  18th May 2019
//  Copyright (c) 2019-20 Rathish Kannan. All rights reserved.
//----------------------------------------------------------------------------------------------------------------------------------------

import UIKit

protocol CategoriesDisplayLogic: class{
    func displayFetchedCategories(viewModel: Category.FetchCategories.ViewModel)
}

protocol DetailsDisplayLogic: class{
    func displayDetails(viewModel: Details.FetchDetails.ViewModel)
}


class CategoriesViewController: UIViewController, CategoriesDisplayLogic {

    var interactor: FetchCategoriesBusinessLogic?
    var router: (NSObjectProtocol & CategoriesRoutingLogic & CategoriesDataPassing)?

    var detailsInteractor: FetchDetailsBusinessLogic?
    var detailsRouter: (NSObjectProtocol & DetailsRoutingLogic & DetailsDataPassing)?

    /// Mode of View
    ///
    /// - list: Intial screen with list of resources
    /// - detail: detail of selected resource
    enum Mode {
        case list,detail
    }
    
    var mode:Mode = .list{
        didSet {
            setUp()
        }
    }

    
    var items: [ListViewModelItem] = []

    @IBOutlet weak var tableView: UITableView!

    // MARK: Object lifecycle

  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?){
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    setUp()
  }

  required init?(coder aDecoder: NSCoder)
  {
    super.init(coder: aDecoder)
    setUp()
  }

  // MARK: Setup

  private func setUp(){
    if mode == .list {
        let viewController        = self
        let interactor            = CategoriesInteractor()
        let presenter             = CategoriesPresenter()
        let router                = CategoriesRouter()
        viewController.interactor = interactor
        viewController.router     = router
        interactor.presenter      = presenter
        presenter.viewController  = viewController
        router.viewController     = viewController
        router.dataStore          = interactor
    }else{
        let viewController        = self
        let interactor            = DetailsInteractor()
        let presenter             = DetailsPresenter()
        let router                = DetailsRouter()
        viewController.detailsInteractor = interactor
        viewController.detailsRouter     = router
        interactor.presenter      = presenter
        presenter.viewController  = viewController
        router.viewController     = viewController
        router.dataStore          = interactor

    }
    
  }

  // MARK: View lifecycle

    override func viewDidLoad(){
        super.viewDidLoad()
        fetchCategories()
        setUpTableView()
    }

    private func setUpTableView(){
        tableView?.register(ListCell.nib, forCellReuseIdentifier: ListCell.identifier)
    }
    
    // MARK: Routing
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if let scene              = segue.identifier {
            let selector              = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router             = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }

    // MARK: Setup Functions

    func fetchCategories(){
        let request               = Category.FetchCategories.Request(id: "categories")
        interactor?.fetchCategories(request: request)
    }

    func displayFetchedCategories(viewModel: Category.FetchCategories.ViewModel){
        let vm =  viewModel.categories
        items = vm
        if items.count == 0 {
            let noResult = NoResultsItem(name:"No Results found, please try again.")
            items.append(noResult)
        }
        
        tableView.reloadData()
    }
}

//MARK: - UITableViewDataSource
extension CategoriesViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return  items.filter { $0.type == .list }.count > 0 ? items.filter { $0.type == .list }.first?.rowCount ?? 0 : items.filter { $0.type == .noResult }.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.filter { $0.type == .list }.count > 0 ? items.count : items.filter { $0.type == .noResult }[section].rowCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items.filter { $0.type == .list }[indexPath.row]
        switch item.type {
        case .list:
            if let cell = tableView.dequeueReusableCell(withIdentifier: ListCell.identifier, for: indexPath) as? ListCell {
                cell.item = item
                return cell
            }
        case .noResult:
            return UITableViewCell()
        case .details:
            return UITableViewCell()
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return items[section].type == .list ? "" : items[section].sectionTitle
    }
}

extension CategoriesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        mode = .detail
        fetchDetails(for: items[indexPath.row])
    }
}


extension CategoriesViewController: DetailsDisplayLogic {
    func fetchDetails(for selection: ListViewModelItem){
        guard let item = selection as? Category.FetchCategories.ViewModel.ListItem else {
            return
        }
        
        let request = Details.FetchDetails.Request(id: item.id)
        detailsInteractor?.fetchDetails(request: request)
    }

    func displayDetails(viewModel: Details.FetchDetails.ViewModel) {
        
        
    }
    
}
