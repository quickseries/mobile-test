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


protocol DetailsDisplayLogic: class{
    func displayDetails(viewModel: Details.FetchDetails.ViewModel)
}

class DetailsViewController: UIViewController, DetailsDisplayLogic {

    var interactor: FetchDetailsBusinessLogic?
    var router: (NSObjectProtocol & DetailsRoutingLogic & DetailsDataPassing)?

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
    let viewController        = self
    let interactor            = DetailsInteractor()
    let presenter             = DetailsPresenter()
    let router                = DetailsRouter()
    viewController.interactor = interactor
    viewController.router     = router
    interactor.presenter      = presenter
    presenter.viewController  = viewController
    router.viewController     = viewController
    router.dataStore          = interactor

  }

  // MARK: View lifecycle

    override func viewDidLoad(){
        super.viewDidLoad()
        setUpTableView()
    }

    private func setUpTableView(){
        tableView?.register(NamePictureCell.nib, forCellReuseIdentifier: NamePictureCell.identifier)
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
    
    func fetchDetails(for selection: ListViewModelItem){
        guard let item = selection as? Category.FetchCategories.ViewModel.ListItem else {
            return
        }
        
        let request = Details.FetchDetails.Request(id: item.id == "restaurants" ? "restaurants" : "vacation-spot")
        interactor?.fetchDetails(request: request)
    }
    
    func displayDetails(viewModel: Details.FetchDetails.ViewModel) {
        let vm =  viewModel.details
        items = vm
        if items.count == 0 {
            let noResult = NoResultsItem(name:"No Results found, please try again.")
            items.append(noResult)
        }
        
    }

}

//MARK: - UITableViewDataSource
extension DetailsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        if mode == .detail {
            return  items.filter { $0.type == .details }.count > 0 ? items.filter { $0.type == .details }.first?.rowCount ?? 0 : items.filter { $0.type == .noResult }.count
        }else{
            return  items.filter { $0.type == .list }.count > 0 ? items.filter { $0.type == .list }.first?.rowCount ?? 0 : items.filter { $0.type == .noResult }.count
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if mode == .detail {
            return items.filter { $0.type == .details }.count > 0 ? items.count : items.filter { $0.type == .noResult }[section].rowCount
        }else{
            return items.filter { $0.type == .list }.count > 0 ? items.count : items.filter { $0.type == .noResult }[section].rowCount
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items.filter { mode == .list ? $0.type == .list : $0.type == .details }[indexPath.row]
        switch item.type {
        case .list:
            if let cell = tableView.dequeueReusableCell(withIdentifier: ListCell.identifier, for: indexPath) as? ListCell {
                cell.item = item
                return cell
            }
        case .noResult:
            return UITableViewCell()
        case .details:
            if let cell = tableView.dequeueReusableCell(withIdentifier: NamePictureCell.identifier, for: indexPath) as? NamePictureCell {
                cell.item = item
                return cell
            }
            return UITableViewCell()
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return items[section].type == .list ? "" : items[section].sectionTitle
        
    }
}

extension DetailsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
}


