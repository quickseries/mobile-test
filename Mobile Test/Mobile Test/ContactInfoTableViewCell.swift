//
//  ContactInfoTableViewCell.swift
//  Mobile Test
//
//  Created by Tom Cheung on 2017-09-22.
//  Copyright © 2017 Tom Cheung. All rights reserved.
//

import UIKit

@objc protocol ContactInfoTableViewCellProtocol {
    @objc optional func openEmail(email:String)
    @objc optional func openWebBrowser(browser:String)
    @objc optional func openPhone(phone:String)
    @objc optional func openMaps(address:String)
}

class ContactInfoTableViewCell: UITableViewCell {
    
    weak var delegate: ContactInfoTableViewCellProtocol!
    
    var titleLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .red
        return label
    }()
    
    var detailsLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .darkGray
        label.numberOfLines = 0
        return label
    }()
    
    var button:UIButton = {
        let button = UIButton(type: UIButtonType.system)
        button.tintColor = .red
        return button
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(titleLabel)
        contentView.addSubview(detailsLabel)
        contentView.addSubview(button)
        self.updateConstraints()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupButton(type:ContactInfoFields){
        switch type {
        case .email:
            button.addTarget(self, action: #selector(ContactInfoTableViewCell.openEmail), for: .touchUpInside)
            button.setImage(UIImage(named: "close-envelope"), for: .normal)
        case .website:
            button.addTarget(self, action: #selector(ContactInfoTableViewCell.openWebBrowser), for: .touchUpInside)
            button.setImage(UIImage(named: "forward-arrow"), for: .normal)
        case .phoneNumber, .tollFree:
            button.addTarget(self, action: #selector(ContactInfoTableViewCell.openPhone), for: .touchUpInside)
            button.setImage(UIImage(named: "call-answer"), for: .normal)
        default:
            break
        }
    }
    
    func setupAddress() {
        button.addTarget(self, action: #selector(ContactInfoTableViewCell.openMaps), for: .touchUpInside)
        button.setImage(UIImage(named: "pin"), for: .normal)
    }
    
    func openEmail(){
        self.delegate.openEmail!(email: self.detailsLabel.text!)
    }
    
    func openWebBrowser(){
        self.delegate.openWebBrowser!(browser: self.detailsLabel.text!)
    }
    
    func openPhone(){
        self.delegate.openPhone!(phone: self.detailsLabel.text!)
    }
    
    func openMaps(){
        self.delegate.openMaps!(address: self.detailsLabel.text!)
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        contentView.addConstraintsWithFormat(format: "H:|-(16)-[v0]", views: titleLabel)
        contentView.addConstraintsWithFormat(format: "H:|-(16)-[v0]", views: detailsLabel)
        contentView.addConstraintsWithFormat(format: "V:|[v0(30)][v1]|", views: titleLabel, detailsLabel)
        contentView.addConstraintsWithFormat(format: "H:[v0(20)]-(16)-|", views: button)
        button.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        button.widthAnchor.constraint(equalTo: button.heightAnchor).isActive = true
    }
}
