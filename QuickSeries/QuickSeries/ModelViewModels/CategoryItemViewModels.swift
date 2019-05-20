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
        
        loadCategoriesItem(_fileName: JsonFiles.restuarant)
        loadCategoriesItem(_fileName: JsonFiles.vacations)
        
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
    var shouldShowAddress: Bool = false
    var workingDays: [(String,String)] = []
    
    var activeLat : Double!
     var activeLog : Double!
     var activePhoneNumber : String!
     var activeEmail : String!
     var activeURL : String!
    
     var activeSocialLink : SocialMedia!
     var activeAddress : Addresses!
     var itemDetails : CategoryItemViewModel!
   // var description: String!
    
    init(object: CategoryItem) {
    
        
      
        workingDays.append(("Monday", (object.bizHours?.monday.from ?? "") + " - " + (object.bizHours?.monday.to ?? "")))
        workingDays.append(("Tuesday", (object.bizHours?.tueday.from ?? "") + " - " + (object.bizHours?.tueday.to ?? "")))
        workingDays.append(("Wednesday", (object.bizHours?.wednesday.from ?? "") + " - " + (object.bizHours?.wednesday.to ?? "")))
        workingDays.append(("Thursday", (object.bizHours?.thursday.from ?? "") + " - " + (object.bizHours?.thursday.to ?? "")))
        workingDays.append(("Friday", (object.bizHours?.friday.from ?? "") + " - " + (object.bizHours?.friday.to ?? "")))
        workingDays.append(("Saturday", (object.bizHours?.saturday.from ?? "") + " - " + (object.bizHours?.saturday.to ?? "")))
        workingDays.append(("Sunday", (object.bizHours?.sunday.from ?? "") + " - " + (object.bizHours?.sunday.to ?? "")))
       
        
        
     self.categoryItem = object
     self.descriptionTxt = object.description
        
        if ((object.addresses ?? []).count > 0) {
            shouldShowAddress = true
        }
        
        for item in (object.addresses ?? []) {
            
            if (item.address1 ?? "").isEmpty {
                shouldShowAddress = false
            }
            
            if (item.country ?? "").isEmpty {
                shouldShowAddress = false
            }
            
            if (item.zipCode ?? "").isEmpty {
                shouldShowAddress = false
            }
            
            
            if (item.city ?? "").isEmpty {
                shouldShowAddress = false
            }
        }
        
        
        
        
    
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
