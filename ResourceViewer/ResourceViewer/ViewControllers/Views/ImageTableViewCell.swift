//
//  ImageTableViewCell.swift
//  ResourceViewer
//
//  Created by Tarang Patel on 2017-11-12.
//  Copyright © 2017 Tarang Patel. All rights reserved.
//

import UIKit



class ImageTableViewCell: UITableViewCell {

    @IBOutlet weak var photoView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func loadPhoto(urlString: String) {
        
        if let url = URL(string: urlString) {
            self.photoView.downloadedFrom(url: url)
        }
    }
}
