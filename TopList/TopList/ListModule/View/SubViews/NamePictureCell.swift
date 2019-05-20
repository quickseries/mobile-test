//
//  NamePictureCell.swift
//  NewsList
//
//  Created by Rathish Kannan
//  Copyright © 2018 Rathish Kannan. All rights reserved.
//

import UIKit

class NamePictureCell: UITableViewCell {

    @IBOutlet weak var overView: UILabel?
    @IBOutlet weak var pictureImageView: UIImageView?
    
    var item: ListViewModelItem? {
        didSet {
            guard let item = item as? Details.FetchDetails.ViewModel.DetailsItem   else {
                return
            }            
           // pictureImageView?.image = UIImage(url: URL(string: item.sectionTitle))
            overView?.text = item.overView
        }
    }
    
    
    static var nib:UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    static var identifier: String {
        return String(describing: self)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        pictureImageView?.image = nil
    }    
}
