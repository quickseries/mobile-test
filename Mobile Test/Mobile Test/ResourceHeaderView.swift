//
//  ResourceHeader.swift
//  Mobile Test
//
//  Created by Tom Cheung on 2017-09-21.
//  Copyright © 2017 Tom Cheung. All rights reserved.
//

import UIKit

class ResourceHeaderView: UIView {

    var shouldSetupConstraints = true
    var screenWidth = UIScreen.main.bounds.width
    var screenHeight = UIScreen.main.bounds.height
    
    var resourceTitle:UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    var resourceImageView:UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    var resourceDescription:UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        customSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        customSetup()
    }
    
    func customSetup(){
        addSubview(resourceTitle)
        addSubview(resourceImageView)
        addSubview(resourceDescription)
    }

    override func updateConstraints() {
        if (shouldSetupConstraints){
            addConstraintsWithFormat(format: "H:|[v0]|", views: resourceImageView)
            addConstraintsWithFormat(format: "H:|[v0]|", views: resourceTitle)
            addConstraintsWithFormat(format: "H:|[v0]|", views: resourceDescription)
            addConstraintsWithFormat(format: "V:|[v0(200)][v1(30)][v2]|", views: resourceImageView, resourceTitle, resourceDescription)
            shouldSetupConstraints = false
        }
        super.updateConstraints()
    }
    
}



