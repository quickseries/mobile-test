//
//  PhoneCell.swift
//  mobile-test
//
//  Created by Ali Pishvaee on 4/26/19.
//  Copyright © 2019 Ali Pishvaee. All rights reserved.
//

import UIKit

class PhoneCell: UITableViewCell {
    
    var callButtonSelected: (() -> ())?
    var messageButtonSelected: (() -> ())?
    
    lazy var phoneCaption: UILabel = {
        let label = UILabel()
        label.textColor = .red
        label.text = "PHONE NUMBER"
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        return label
    }()
    
    lazy var callButton: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "call"), for: .normal)
        return button
    }()
    
    lazy var messageButton: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "message"), for: .normal)
        return button
    }()
    
    lazy var numberText: UILabel = {
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
        [phoneCaption,numberText,callButton,messageButton].forEach({ addSubview($0) })
        phoneCaption.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 4, left: 15, bottom: 0, right: 0), size: .init(width: 150, height: 30))
        callButton.anchor(top: topAnchor, leading: nil, bottom: nil, trailing: trailingAnchor, padding: .init(top: 10, left: 0, bottom: 0, right: 16), size: .init(width: 50, height: 50))
        messageButton.anchor(top: topAnchor, leading: nil, bottom: nil, trailing: callButton.leadingAnchor, padding: .init(top: 10, left: 0, bottom: 0, right: 4), size: .init(width: 50, height: 50))
        numberText.anchor(top: phoneCaption.bottomAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: messageButton.leadingAnchor, padding: .init(top: 8, left: 16, bottom: 8, right: 16), size: .zero)
        
        callButton.addTarget(self, action: #selector(handleCall(_:)), for: .touchUpInside)
        messageButton.addTarget(self, action: #selector(handleMessage(_:)), for: .touchUpInside)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func handleCall(_ sender: UIButton) {
        callButtonSelected?()
    }
    @objc func handleMessage(_ sender: UIButton) {
        messageButtonSelected?()
    }
    
}

