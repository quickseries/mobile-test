//
//  DetailImageCell.swift
//  mobile-test
//
//  Created by Ali Pishvaee on 4/26/19.
//  Copyright © 2019 Ali Pishvaee. All rights reserved.
//

import UIKit

class DetailImageCell: UITableViewCell {
    
    lazy var detailImageView: UIImageView = {
        let iv = UIImageView()
        return iv
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(detailImageView)
        detailImageView.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .zero, size: .zero)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

