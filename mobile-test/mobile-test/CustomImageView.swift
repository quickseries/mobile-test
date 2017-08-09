//
//  CustomImageView.swift
//  mobile-test
//
//  Created by Martin Gyupchanov on 09-08-17.
//  Copyright © 2017 Martin Gyupchanov. All rights reserved.
//
import UIKit

class CustomImageView: UIImageView {
  
  // MARK: - Constants
  
  let imageCache = NSCache<NSString, AnyObject>()
  
  // MARK: - Properties
  
  var imageURLString: String?
  
  func downloadedFrom(url: URL, contentMode mode: UIViewContentMode = .scaleToFill) {
    contentMode = mode
    
    if let cachedImage = imageCache.object(forKey: url.absoluteString as NSString) as? UIImage {
      self.image = cachedImage
    } else {
      URLSession.shared.dataTask(with: url) { (data, response, error) in
        guard
          let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
          let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
          let data = data, error == nil,
          let image = UIImage(data: data)
          else { return }
        
        self.imageCache.setObject(image, forKey: url.absoluteString as NSString)
        
        DispatchQueue.main.async() { () -> Void in
          self.image = image
        }
        }.resume()
    }
  }
  func downloadedFrom(link: String, contentMode mode: UIViewContentMode = .scaleToFill) {
    guard let url = URL(string: link) else { return }
    downloadedFrom(url: url, contentMode: mode)
  }
}

