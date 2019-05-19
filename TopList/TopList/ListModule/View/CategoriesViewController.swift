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

    }
}
