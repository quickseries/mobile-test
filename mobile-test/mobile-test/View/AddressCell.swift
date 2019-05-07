//
//  AddressCell.swift
//  mobile-test
//
//  Created by Ali Pishvaee on 4/26/19.
//  Copyright © 2019 Ali Pishvaee. All rights reserved.
//

import UIKit

class AddressCell: UITableViewCell {
    
    var locationSelected: (() -> ())?
    
    lazy var addressCaption: UILabel = {
        let label = UILabel()
        label.textColor = .red
        label.text = "ADDRESS"
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        return label
    }()
    
    lazy var locationButton: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "gps"), for: .normal)
        return button
    }()
    
    lazy var addressText: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        return label
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        [addressCaption,locationButton,addressText].forEach({addSubview($0)})
        addressCaption.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 4, left: 15, bottom: 0, right: 0), size: .init(width: 100, height: 40))
        locationButton.anchor(top: topAnchor, leading: nil, bottom: nil, trailing: trailingAnchor, padding: .init(top: 10, left: 0, bottom: 0, right: 16), size: .init(width: 50, height: 50))
        addressText.anchor(top: addressCaption.bottomAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: locationButton.leadingAnchor, padding: .init(top: 8, left: 16, bottom: 8, right: 16), size: .zero)
        locationButton.addTarget(self, action: #selector(handleLocation(_:)), for: .touchUpInside)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    @objc func handleLocation(_ sender: UIButton) {
        locationSelected?()
    }
    
}

