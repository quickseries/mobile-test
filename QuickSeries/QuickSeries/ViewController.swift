//
//  ViewController.swift
//  QuickSeries
//
//  Created by Engineer 144 on 17/05/2019.
//

import UIKit
import Foundation

class ViewController: UIViewController {

  private let dataLoader = QuickOperationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
      /**
         dataLoader.loadData(fileName: "categories") { (data) in
         
         DispatchQueue.main.async {
         let jsonDecoder = JSONDecoder()
         let responseModel = try jsonDecoder.decode(CategoryResponse.self, from: data!)
         } as! @convention(block) () -> Void
         
         
         
         }
         */
        
        
        
        dataLoader.loadData(fileName: "categories") { (data) in
            
            
            print(data)
        }
        
        
     
        
    }
    
    
    


}

