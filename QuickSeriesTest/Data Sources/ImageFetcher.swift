//
//  ImageFetcher.swift
//  QuickSeriesTest
//
//  Created by Mathieu Massicotte on 2019-04-22.
//  Copyright © 2019 Via Logica Inc. All rights reserved.
//

import UIKit

class ImageFetcher {
    static func imageFromURL(withString stringURL: String, forImageView imageView: UIImageView) {
        let url = URL(string: stringURL)
        
        DispatchQueue.global().async {
            do{
                let data = try Data(contentsOf: url!)
                DispatchQueue.main.async {
                    imageView.image = UIImage(data: data)
                }
            } catch let error {
                print(error.localizedDescription)
            }
        }
    }
}
