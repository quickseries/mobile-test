//
//  ResourceCell.swift
//  Mobile Test
//
//  Created by Alecu Truica on 5/18/19.
//  Copyright © 2019 Alecu Truica. All rights reserved.
//

import UIKit

class ResourceCell: UITableViewCell {
    @IBOutlet weak var resourcePhotoImageView: UIImageView!
    @IBOutlet weak var resourceTitle: UITextField!
    @IBOutlet weak var resourceDescriptionTextView: UITextView!
    @IBOutlet weak var resourceDetailsButton: UIButton!
    
    var resourceToDisplay = Resource(id: "", slug: "", eid: "", title: "", description: "", bizHours: nil, categoryEid: "", _v: 0, photoURL: "", active: false, updatedAt: "", createdAt: "", addresses: nil, contactInfo: nil, socialMedia: nil) {
        didSet {
            if resourceToDisplay.id != "" {
                resourceTitle.text = resourceToDisplay.title
                let data = Data(resourceToDisplay.description.utf8)
                if let attributedDescription = try? NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil) {
                    DispatchQueue.main.async {
                        self.resourceDescriptionTextView.text = attributedDescription.string
                        self.layoutIfNeeded()
                    }
                }
                guard let photoURL = URL(string: resourceToDisplay.photoURL) else {
                    print("invalid resource photo url")
                    return
                }
                URLSession.shared.dataTask(with: photoURL) { (data, response, error) in
                    if let data = data, error == nil {
                        DispatchQueue.main.async {
                            self.resourcePhotoImageView.image = UIImage(data: data)
                        }
                    }
                    }.resume()
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.selectionStyle = .none
    }
}

