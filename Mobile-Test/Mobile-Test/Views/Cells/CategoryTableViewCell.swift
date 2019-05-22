//
//  CategoryTableViewCell.swift
//  Mobile-Test
//
//  Created by Leopold Roitel on 2019-05-19.
//  Copyright © 2019 Leopold. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

final class CategoryTableViewCell: UITableViewCell, NibReusable {

    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var customImageView: UIImageView!
    
    func config(withTitle title: String, description: String?, photoUrl: URL?) {
        self.titleLabel.text = title
        if let description = description {
            self.descriptionLabel.text = description
        } else {
            self.descriptionLabel.isHidden = true
        }
        
        if let photoUrl = photoUrl {
            // Using the default cache and doing the request inside the cell because I am lazy 🙈
            Alamofire.request(photoUrl).responseImage { [weak self] response in
                guard let image = response.result.value else {
                    return // TODO:
                }
                self?.customImageView.image = image
            }
        } else {
            customImageView.isHidden = true
        }
    }
}
