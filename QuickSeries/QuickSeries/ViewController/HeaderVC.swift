//
//  HeaderVC.swift
//  QuickSeries
//
//  Created by Parth Patel on 15/05/20.
//  Copyright © 2020 Parth Patel. All rights reserved.
//

import UIKit

class HeaderVC: UIViewController {

    @IBOutlet var placeImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    var resource: Resources!
    
    init(resource: Resources) {
        super.init(nibName: nil, bundle: nil)
        self.resource = resource
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUIElements()
    }
    
    func configureUIElements() {
        NetworkManager.shared.downloadImage(imageView: placeImageView, urlString: resource.photo ?? "")
        titleLabel.text = resource.title
        
        descriptionLabel.attributedText = resource.description?.convertHtmlToAttributedStringWithCSS(font: UIFont(name: "Arial", size: 14), cssColor: "black", lineHeight: 5, cssTextAlign: "left")
            
    }
}
