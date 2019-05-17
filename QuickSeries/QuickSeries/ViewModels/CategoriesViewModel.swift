//
//  CategoryViewModel.swift
//  QuickSeries
//
//  Created by Engineer 144 on 17/05/2019.
//

import Foundation
import UIKit

class CategoriesViewModel: NSObject {
    
    @objc dynamic private(set) var categoryViewModels : [CategoryViewModel] = [CategoryViewModel]()
    private var token :NSKeyValueObservation?
    var bindSourceToModels :(() -> ()) = {  }
    private let dataLoader = QuickOperationManager()
    let jsonDecoder = JSONDecoder()
    
    
   
    init(key: String) {
        
        
        super.init()
        
       token = self.observe(\.categoryViewModels) { _, _ in
            self.bindSourceToModels()
        }
        
       loadCategories()
       
    }
    
   
    func loadCategories(){
       
        dataLoader.loadData(fileName: JsonFiles.category) { [unowned self] data in
            
            
            main {
                do {
                    let response = try self.jsonDecoder.decode(CategoryResponse.self, from: data)
                    
               self.categoryViewModels = response.compactMap({ (element) in
                        CategoryViewModel(object: element)
                    })
                    
              /** for items in response {
                     
                     self.categoryListViewModel.append(CategoryViewModel(object: items))
                     }
                 **/
                    
                    
                }catch{
                    
                    // self.categoryViewModels = []
                }
            }
            
           
            
        }
    }
    
    func destroyObservers() {
        self.token?.invalidate()
    }
    
    
    func source(at index:Int) -> CategoryViewModel {
        return self.categoryViewModels[index]
    }


}


class CategoryViewModel:NSObject {
    
   
    var image: UIImage!
    var category: Category!
    
     init(object: Category) {
        
        self.image = LetterImageGenerator.imageWith(name: object.title ?? "")
        self.category = object
    }
    
}

/*
 
 class Source {
 
 var id :String!
 var name :String!
 var description :String!
 
 init?(dictionary :JSONDictionary) {
 
 guard let id = dictionary["id"] as? String,
 let name = dictionary["name"] as? String,
 let description = dictionary["description"] as? String else {
 return nil
 }
 
 self.id = id
 self.name = name
 self.description = description
 }
 
 init(viewModel :SourceViewModel) {
 
 self.id = viewModel.id
 self.name = viewModel.name
 self.description = viewModel.body
 }
 
 }

 **/
