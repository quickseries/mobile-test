//
//  File.swift
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
}

class CategoryCell: UITableViewCell {
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    
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
    }
}

extension CategoryCell: ConfigurableView {
    typealias DataType = CategoryForUI
    
    func configure(with data: CategoryForUI) {
        titleLabel.text = data.title
        descriptionLabel.text = data.description
        
        updateAccessibilityLabels()
    }
}

extension CategoryCell: VoiceOverAccessible {
    func setupAccessibility() {
        contentView.isAccessibilityElement = true
        titleLabel.isAccessibilityElement = false
        descriptionLabel.isAccessibilityElement = false

        contentView.accessibilityTraits = .button
    }
    
    func assignAccessibilityIds() {
        titleLabel.accessibilityIdentifier = "CategoryCell.title"
        descriptionLabel.accessibilityIdentifier = "CategoryCell.description"
    }
    
    func updateAccessibilityLabels() {
        guard let title = titleLabel.text,
            let description = descriptionLabel.text else {
                contentView.accessibilityLabel = nil
                return
        }
        
        contentView.accessibilityLabel = "\(title) \n\n \(description)"
    }
}
