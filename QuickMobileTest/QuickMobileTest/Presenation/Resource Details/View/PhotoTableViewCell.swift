//
//  PhotoTableViewCell.swift
//  QuickMobileTest
//
//  Created by Balaji Galave on 5/18/19.
//

import UIKit

class PhotoTableViewCell: UITableViewCell {

    @IBOutlet private weak var photoImageView: UIImageView! {
        didSet {
            photoImageView.contentMode = .scaleAspectFit
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        selectionStyle = .none
        // Configure the view for the selected state
    }
    
    func loadImage(with urlString: String) {
        guard let url = URL(string: urlString) else {
            return
        }
        ImageDownloadManager.downloadImage(with: url) { [weak self] (image) in
            self?.photoImageView.image = image
        }
    }
    
}
