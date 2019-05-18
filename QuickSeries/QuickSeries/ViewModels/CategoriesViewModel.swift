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
            
            
            mainThread {
                do {
                    let response = try self.jsonDecoder.decode(CategoryResponse.self, from: data as! Data)
                    
               self.categoryViewModels = response.compactMap({ (element) in
                        CategoryViewModel(object: element)
                    })
                    }catch{
                    
                   
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

