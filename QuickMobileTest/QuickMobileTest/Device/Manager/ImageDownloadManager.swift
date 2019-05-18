//
//  ImageDownloadManager.swift
//  QuickMobileTest
//
//  Created by Balaji Galave on 5/19/19.
//

import Foundation
import UIKit

class ImageDownloadManager {
    
    
    class func downloadImage(with url: URL, completion: @escaping (UIImage) -> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { completion(UIImage())
                    return  }
            DispatchQueue.main.async() {
                completion(image)
            }
            }.resume()
    }
    
}
