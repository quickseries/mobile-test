//
//  ResourceViewController.swift
//  mobileTest
//
//  Created by Balraj Singh on 17/05/19.
//  Copyright © 2019 balraj. All rights reserved.
//

import UIKit

class ResourceViewController: UIViewController {
  
  let viewModel: ResourcesViewModel
  
  public init(forCategory category: String) {
    self.viewModel = ResourcesViewModel(withCategory: category, withUsecase: ResourcesUsecase(service: AppEnvironment.current.apiService))
    super.init(nibName: String.stringFromClass(ResourceViewController.self), bundle: Bundle.main)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
    self.title = self.viewModel.selectedCategory
  }
  
  
  /*
   // MARK: - Navigation
   
   // In a storyboard-based application, you will often want to do a little preparation before navigation
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
   // Get the new view controller using segue.destination.
   // Pass the selected object to the new view controller.
   }
   */
  
}
