//
//  Utilities.swift
//  QuickSeries
//
//  Created by Engineer 144 on 17/05/2019.
//

import UIKit
import Foundation


 func underground(work: @escaping () -> ()) {
    DispatchQueue.global(qos: .userInitiated).async {
        work()
    }
}

 func mainThread(work: @escaping () -> ()) {
    DispatchQueue.main.async {
        work()
    }
}
private let dataLoader = QuickOperationManager()

extension UIImageView {
    
   func setImage(url: String) {
    
    
    dataLoader.loadImage(urlString: url) { [unowned self] data in
        
        mainThread {
            self.image = UIImage(data: data as! Data)
        }
        
    }
    
    }
}

extension String {
    var htmlToAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return NSAttributedString() }
        do {
            return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding:String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            return NSAttributedString()
        }
    }
    var htmlToString: String {
        return htmlToAttributedString?.string ?? ""
    }
}
