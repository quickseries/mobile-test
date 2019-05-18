//
//  CategoryDetailViewModel.swift
//  QuickSeries
//
//  Created by Engineer 144 on 17/05/2019.
//

import Foundation
import UIKit
class CategoryItemViewModels: NSObject {
     private var sorted: Bool = false
    @objc dynamic private(set) var categoryItemViewModels : [CategoryItemViewModel] = [CategoryItemViewModel]()
    private var token :NSKeyValueObservation?
    var bindSourceToModels :(() -> ()) = {  }
    private let dataLoader = QuickOperationManager()
    let jsonDecoder = JSONDecoder()
    
    var queryParam: String!
    
    
    init(queryParams: String) {
        
        
        super.init()
        
        self.queryParam = queryParams
        token = self.observe(\.categoryItemViewModels) { _, _ in
            self.bindSourceToModels()
        }
        
        loadCategoriesItem(_fileName: "restaurants")
        loadCategoriesItem(_fileName: "vacation-spot")
        
    }
    
    
    func loadCategoriesItem(_fileName: String){
        
        
        dataLoader.loadData(fileName: _fileName) { [unowned self] data in
            
            
            mainThread {
                do {
                    let response = try self.jsonDecoder.decode(CategoryItems.self, from: data as! Data)
                    let list = response.compactMap({ (element) in
                        
                        CategoryItemViewModel(object: element)
                        
                    })
                        
                  
                    
                    self.categoryItemViewModels.append(contentsOf: list.filter{$0.categoryItem.category_eid ?? "" == self.queryParam ?? ""})
                    
                   
                    
                 
                }catch{
                    
                    
                }
            }
            
            
            
        }
    }
    
    func destroyObservers() {
        self.token?.invalidate()
    }
    
    
    func source(at index:Int) -> CategoryItemViewModel {
        return self.categoryItemViewModels[index]
    }
    
    
}


class CategoryItemViewModel: NSObject {

    
 
    var type: String!
    var categoryItem: CategoryItem!
    var descriptionTxt : String!
    init(object: CategoryItem) {
    
      self.categoryItem = object
        self.descriptionTxt = object.description
    
}
    
    
  
    
}


extension CategoryItemViewModels {
    
   func  sortAlpaBeTically(){
    
    
    }
    
    func sortItems() {
        self.sorted = !self.sorted
        
        
        if (self.sorted) {
        self.categoryItemViewModels = self.categoryItemViewModels.sorted(by: { $0.categoryItem.title ?? "" < $1.categoryItem.title ?? "" })
        } else{
         self.categoryItemViewModels = self.categoryItemViewModels.sorted(by: { $0.categoryItem.title ?? "" > $1.categoryItem.title ?? "" })
        }
        self.bindSourceToModels()
    }
}
