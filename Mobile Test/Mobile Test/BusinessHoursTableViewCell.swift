//
//  BusinessHoursTableViewCell.swift
//  Mobile Test
//
//  Created by Tom Cheung on 2017-09-21.
//  Copyright © 2017 Tom Cheung. All rights reserved.
//

import UIKit

class BusinessHoursTableViewCell: UITableViewCell {

    var dayLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var timeLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = label.font.withSize(12)
        label.textColor = .lightGray
        return label
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(dayLabel)
        contentView.addSubview(timeLabel)
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

    override func updateConstraints() {
        super.updateConstraints()
        contentView.addConstraintsWithFormat(format: "H:|-(16)-[v0]-(>=0)-[v1]-(16)-|", views: dayLabel, timeLabel)
        contentView.addConstraintsWithFormat(format: "V:|[v0(50)]|", views: dayLabel)
        contentView.addConstraintsWithFormat(format: "V:|[v0(50)]|", views: timeLabel)
    }
}
