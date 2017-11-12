//
//  ResourcesViewModel.swift
//  ResourceViewer
//
//  Created by Tarang Patel on 2017-11-12.
//  Copyright © 2017 Tarang Patel. All rights reserved.
//

import Foundation
import ObjectMapper

protocol ResourceVMProtocol {
    
    var isFetchSuccessful: Dynamic<Bool> { get }
    var resources: [Resource] { get }
    var category: Category? { get }
    
    func getResourceList(forCategory: String?)
}

class ResourcesViewModel: ResourceVMProtocol {
 
    var category: Category?
    var isFetchSuccessful: Dynamic<Bool>
    var resources = [Resource]()
    
    init(category: Category) {
        self.category = category
        self.isFetchSuccessful = Dynamic(false)
    }
    
    
    func getResourceList(forCategory: String?) {
        
        guard let cat = forCategory else { return }
        
        ResourceStore().getListOfResources(category: cat) { (result) in
            
            if let r = result {
                self.resources = r
                self.isFetchSuccessful.value = true
            }
            else {
                self.isFetchSuccessful.value = false
            }
        }
    }
}
