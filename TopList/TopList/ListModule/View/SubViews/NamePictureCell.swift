//
//  NamePictureCell.swift
//  NewsList
//
//  Created by Rathish Kannan
//  Copyright © 2018 Rathish Kannan. All rights reserved.
//

import UIKit
import Kingfisher

class NamePictureCell: UITableViewCell {

    @IBOutlet weak var overView: UILabel?
    @IBOutlet weak var pictureImageView: UIImageView?
    
    var item: ListViewModelItem? {
        didSet {
            guard let item = item as? Details.FetchDetails.ViewModel.DetailsItem   else {
                return
            }            
            pictureImageView?.kf.setImage(with: URL.init(string: item.pictureUrl))
            overView?.formattedText(html: item.overView, font: UIFont.init(name: "Chalkduster", size: 18) ?? UIFont.init())
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
