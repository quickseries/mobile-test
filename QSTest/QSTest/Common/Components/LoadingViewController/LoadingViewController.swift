//
//  LoadingViewController.swift
//  QSTest
//
//  Created by Denys Volkov on 2020-05-18.
//  Copyright © 2020 quickseries. All rights reserved.
//

import Foundation
import UIKit

class LoadingViewController: BaseViewController {

    @IBOutlet private weak var activityIndicator: UIActivityIndicatorView!
    private let blurVeiw = BlurEffectView(intensity: 0.3)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        activityIndicator.color = .blue
        activityIndicator.startAnimating()
        setupAccessibility()
        self.view.insertSubview(blurVeiw, at: 0)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIAccessibility.post(notification: .layoutChanged, argument: "loading".localized)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        blurVeiw.frame = self.view.bounds
    }
}

// MARK: - Adds support for accessibility features
extension LoadingViewController: VoiceOverAccessible {
    func setupAccessibility() {
        view.accessibilityViewIsModal = true
        view.isAccessibilityElement = true
    }
    
    func assignAccessibilityIds() {
    }
    
    func updateAccessibilityLabels() {
        view.accessibilityLabel =  "loading".localized
    }
}
