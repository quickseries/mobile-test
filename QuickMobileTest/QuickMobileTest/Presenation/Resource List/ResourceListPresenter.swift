//
//  ResourceListPresenter.swift
//  QuickMobileTest
//
//  Created by Balaji Galave on 5/18/19.
//

import Foundation

protocol ResourceListPresenter {
    func fetchResourceList(with categoryType: CategoryType)
    func resource(at index: Int) -> ResourceItem?
    var countOfResources: Int { get }
    func sortList(by type: SortType)
}

class ResourceListPresenterImpl {
    
    private var resourceItems = [ResourceItem]()
    private let fetchResourceListUseCase: FetchResourceListUseCase
    private weak var view: ResourceListView?
    private let categoryItem: CategoryItem
    
    init(fetchResourceListUseCase: FetchResourceListUseCase, view: ResourceListView, categoryItem: CategoryItem) {
        self.fetchResourceListUseCase = fetchResourceListUseCase
        self.view = view
        self.categoryItem = categoryItem
        fetchResourceList(with: categoryItem.type)
        view.setTitle(with: categoryItem.type)
    }
    
}

extension ResourceListPresenterImpl: ResourceListPresenter {
    
    func fetchResourceList(with type: CategoryType) {
        
        fetchResourceListUseCase.fetchResourceList(for: type) { [weak self] (result) in
            switch result {
            case .success(let items):
                self?.resourceItems = items
                self?.view?.reloadData()
            case .failure(let error):
                Logger.log(message: "\(error.localizedDescription)", messageType: .error)
            }
        }
    }
    
    func resource(at index: Int) -> ResourceItem? {
        if index < resourceItems.count {
            return resourceItems[index]
        }
        return nil
    }
    
    var countOfResources: Int {
        return resourceItems.count
    }
    
    func sortList(by type: SortType) {
        
        switch type {
        case .aToz:
            resourceItems = resourceItems.sorted(by: { (item1, item2) -> Bool in
                item1.title < item2.title
            })
        case .zToa:
            resourceItems = resourceItems.sorted(by: { (item1, item2) -> Bool in
                item1.title > item2.title
            })
        case .none: break
        }
        view?.reloadData()
    }
}
