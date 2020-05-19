//
//  ResourcesListCell.swift
//  QSTest
//
//  Created by Denys Volkov on 2020-05-18.
//  Copyright © 2020 quickseries. All rights reserved.
//

import Foundation
import UIKit

private enum CellConstants {
    static let titleFontSize = CGFloat(16)
    static let descriptionFontSize = CGFloat(12)
    static let imageCornerRadius = CGFloat(4)
}

class ResourcesListCell: UITableViewCell {
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var photoImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        assignAccessibilityIds()
        setupAccessibility()
        configureUI()
    }
    
    private func configureUI() {
        titleLabel.font = UIFont.systemFont(ofSize: CellConstants.titleFontSize)
        descriptionLabel.font = UIFont.systemFont(ofSize: CellConstants.descriptionFontSize)
        
        titleLabel.lineBreakMode = .byWordWrapping
        descriptionLabel.lineBreakMode = .byWordWrapping
        
        titleLabel.numberOfLines = 0
        descriptionLabel.numberOfLines = 0
        
        selectionStyle = .none
        
        photoImageView.layer.cornerRadius = CellConstants.imageCornerRadius
        photoImageView.layer.masksToBounds = true
    }
}

extension ResourcesListCell: ConfigurableView {
    typealias DataType = ResourceForUI
    
    func configure(with data: DataType) {
        titleLabel.text = data.title
        descriptionLabel.text = data.description
        photoImageView.image(with: data.photo, placeHolderImage: nil)
        
        updateAccessibilityLabels()
    }
}

extension ResourcesListCell: VoiceOverAccessible {
    func setupAccessibility() {
        contentView.isAccessibilityElement = true
        titleLabel.isAccessibilityElement = false
        descriptionLabel.isAccessibilityElement = false
        photoImageView.isAccessibilityElement = false

        contentView.accessibilityTraits = .button
    }
    
    func assignAccessibilityIds() {
        titleLabel.accessibilityIdentifier = "ResourcesListCell.title"
        descriptionLabel.accessibilityIdentifier = "ResourcesListCell.description"
    }
    
    func updateAccessibilityLabels() {
        guard let title = titleLabel.text else {
                contentView.accessibilityLabel = nil
                return
        }
        
        guard let description = descriptionLabel.text else {
            contentView.accessibilityLabel = title
            return
        }
        
        contentView.accessibilityLabel = "\(title) \n\n \(description)"
    }
}
