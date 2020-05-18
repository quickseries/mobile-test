//
//  Protocols.swift
//  QSTest
//
//  Created by Denys Volkov on 2020-05-17.
//  Copyright © 2020 quickseries. All rights reserved.
//

import Foundation

protocol BasePresenterProtocol: AnyObject {
    func onViewDidLoad()
}

public protocol ConfigurableView {

    associatedtype DataType

    func configure(with data: Self.DataType)
}

/// This protocol should be used by each class, where accessibility ids should be assigned, or accessibility Labels needs custom values
public protocol VoiceOverAccessible {

    /// Perform initial setup of accessibility such as enabling/disabling accessibility of certain view or perfrom grouping of elements.
    func setupAccessibility()

    /// Assign identifier to all the accessibile views
    func assignAccessibilityIds()

    /// Update lables of all the accessibility views
    func updateAccessibilityLabels()
}
