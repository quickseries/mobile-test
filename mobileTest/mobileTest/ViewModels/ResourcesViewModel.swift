//
//  ResourcesViewModel.swift
//  mobileTest
//
//  Created by Balraj Singh on 17/05/19.
//  Copyright © 2019 balraj. All rights reserved.
//

import Foundation
import PromiseKit

public class ResourcesViewModel {
  let usecase: ResourcesUsecaseProtocol
  let selectedCategory: String
  private var resources: [ResourceModel]?
  private var isSortedAsc: Bool = false
  
  init(withCategory category: String, withUsecase usecase: ResourcesUsecaseProtocol) {
    self.usecase = usecase
    self.selectedCategory = category
  }
  
  public func loadResource() -> Promise<Bool> {
    return self.usecase.getResources(ofType: ResourcesType.getResourceType(forCategory: self.selectedCategory))
      .map { data -> Bool in
        self.resources = data.map { ResourceModel(resourceData: $0) }
        self.sortResources()
        return true
    }
  }
  
  public func getResourcesCount() -> Int {
    return self.resources?.count ?? 0
  }
  
  public func getResource(atIndex index: Int) -> ResourceModel? {
    return self.resources?[index]
  }
  
  public func sortResources() {
    self.resources = self.resources?.sorted(by: { (res1, res2) -> Bool in
      if self.isSortedAsc {
        return res1.title > res2.title
      } else {
        return res1.title < res2.title
      }
    })
    
    self.isSortedAsc = !self.isSortedAsc
  }
}
