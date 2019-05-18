//
//  LoadJsonOperation.swift
//  QuickSeries
//
//  Created by Engineer 144 on 17/05/2019.
//

import Foundation
 class LoadDataOperation: QuickOperation<Data> {
    
    //let session = URLSession()
    
     var OpsType: Bool = false
    
    let mainBundle = Bundle.main
    var fileName : String = ""
   
    
    
    private var session: URLSession
    private var urlString: String = ""
    private var task: URLSessionTask?
    var  cache =   QuickCache.sharedInstance
    
    
    
  
    
    // Constructor  with Url and URLSession
    init(session: URLSession = URLSession.shared, url: String,opType: Bool) {
        self.session = session
        self.urlString = url
        self.OpsType = opType
        
        
        
    }
    
    
    // Constructor  with Url and URLSession
    init( fileName: String) {
      
        self.fileName = fileName
        self.session = URLSession.shared
        self.urlString = ""
        self.OpsType = false
        
    }
    
     
    override public func main() {
        
        if isCancelled {
            return
        }
        
        
        
        switch self.OpsType {
        case false:
            localDataLoadingOperation()
            break
        case true:
            onlineDataLoadingOperation()
            break
        
        }
        
   
        
        
        
    }
    
    
    
    func onlineDataLoadingOperation(){
        
        guard let imageURL = URL(string: urlString) else {
            cancel()
            return
        }
        
        
        // Prepare urlRequest
        var urlRequest = URLRequest(url: imageURL)
        urlRequest.cachePolicy = .returnCacheDataElseLoad
        
        
        
        if let _image = cache[urlString as NSString] {
             complete(result: _image as AnyObject)
            
          
            
            
        }else{
           let task = session.dataTask(with: urlRequest) { (data, response, error) in
            
            if data != nil {
                
                self.cache[self.urlString as NSString] = data as AnyObject
                self.complete(result: data as AnyObject)
            }else{
                 self.complete(result: Data() as AnyObject)
            }
            
                
            }
            
            task.resume()
            
        }
        
        
    }
    
    func localDataLoadingOperation(){
        
        guard let filePath = mainBundle.path(forResource: "data.bundle/\(fileName)", ofType: ".json") else {
            cancel()
            return
        }
        
        do {
            
            let data = try Data(contentsOf: URL(fileURLWithPath: filePath), options: .alwaysMapped)
            self.complete(result: data as AnyObject)
            self.cancel()
            
        }catch{
            self.complete(result: Data() as AnyObject)
            self.cancel()
            
        }
    }
    
    
    
    // MARK: - Cancel
    
    
    
    override func cancel() {
        self.complete(result: Data() as AnyObject)
       super.cancel()
    }
    
    
}

