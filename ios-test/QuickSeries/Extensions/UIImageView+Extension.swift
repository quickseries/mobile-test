//  UIImageView+Extension.swift
//  QuickSeries
//
//  Created by Franck Clement on 05/01/2020.
//  Copyright © 2020 Franck Clement. All rights reserved.

import UIKit
import Foundation

fileprivate let imageCache = NSCache<NSString, UIImage>()

/// Simple extension to make UIImageView able to download images from a URL
/// This implementation uses `NSCache` for image caching, based on the given URL.absoluteString property
extension UIImageView {
    
    public func image(from url: URL) {
        if let imageFromCache = imageCache.object(forKey: url.absoluteString as NSString) {
            self.image = imageFromCache
        } else {
            URLSession.shared.dataTask(with: url) { data, _, error in
                if error != nil {
                    // TODO: Use some placeholder image
                    return
                }
                
                if let data = data, let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        imageCache.setObject(image, forKey: url.absoluteString as NSString)
                        self.image = image
                    }
                } else {
                    // TODO: Use some placeholder image
                    return
                }
            }.resume()
        }
    }
}
