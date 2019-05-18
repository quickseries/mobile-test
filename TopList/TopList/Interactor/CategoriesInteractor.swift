//---------------------------------------------------------------------------------------------------------------------------------------
//  File Name        :   CategoriesInteractor
//  Description      :   Median to request & recieve the data to UI
//                   :   1. UI    - https://github.com/ratzr15/mobile-test/blob/master/resources_android.png
//                       2. Architecture    - TDD + Clean Swift (http://clean-swift.com)
//  Author            :  Rathish Kannan
//  E-mail            :  rathishnk@hotmail.co.in
//  Dated             :  18th May 2019
//  Copyright (c) 2019-20 Rathish Kannan. All rights reserved.
//----------------------------------------------------------------------------------------------------------------------------------------

import UIKit

protocol CategoriesBusinessLogic
{
  func doSomething(request: Categories.Something.Request)
}

protocol CategoriesDataStore
{
  //var name: String { get set }
}

class CategoriesInteractor: CategoriesBusinessLogic, CategoriesDataStore
{
  var presenter: CategoriesPresentationLogic?
  var worker: CategoriesWorker?
  //var name: String = ""
  
  // MARK: Do something
  
  func doSomething(request: Categories.Something.Request)
  {
    worker = CategoriesWorker()
    worker?.doSomeWork()
    
    let response = Categories.Something.Response()
    presenter?.presentSomething(response: response)
  }
}
