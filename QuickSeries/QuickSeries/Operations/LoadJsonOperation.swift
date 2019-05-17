//
//  LoadJsonOperation.swift
//  QuickSeries
//
//  Created by Engineer 144 on 17/05/2019.
//

import Foundation
 class LoadJsonOperation: QuickOperation<Data> {
    
    //let session = URLSession()
    
    
    let mainBundle = Bundle.main
    let fileName : String
    
    
    
    // Constructor  with Url and URLSession
    init( fileName: String) {
      
        self.fileName = fileName
        
    }
    
     
    override public func main() {
        
        if isCancelled {
            return
        }
        
        
        
        guard let filePath = mainBundle.path(forResource: "data.bundle/\(fileName)", ofType: ".json") else {
            cancel()
            return
        }
        
        do {
            
            let data = try Data(contentsOf: URL(fileURLWithPath: filePath), options: .alwaysMapped)
            self.complete(result: data)
            self.cancel()
            
        }catch{
            self.complete(result: Data())
            self.cancel()
            
        }
        
        
        
    }
    
    // MARK: - Cancel
    
    
    
    override func cancel() {
        self.complete(result: Data())
       super.cancel()
    }
    
    
}

