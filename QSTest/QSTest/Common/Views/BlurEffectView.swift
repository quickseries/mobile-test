//
//  BlurEffectView.swift
//  QSTest
//
//  Created by Denys Volkov on 2020-05-18.
//  Copyright © 2020 quickseries. All rights reserved.
//

import Foundation
import UIKit

/// This is blurred view, with an API to customize the blur intensity (from 0 to 1)
/// By default, this API is not ptovided by UIKit.
class BlurEffectView: UIVisualEffectView {
    
    // MARK: Private
    private var animator: UIViewPropertyAnimator!
    
    /// Create visual effect view with given effect and its intensity
    ///
    /// - Parameters:
    ///   - effect: visual effect, eg UIBlurEffect(style: .dark)
    ///   - intensity: custom intensity from 0.0 (no effect) to 1.0 (full effect) using linear scale
    init(effect: UIVisualEffect = UIBlurEffect(style: .regular), intensity: CGFloat) {
        if #available(iOS 11.0, *) {
            super.init(effect: nil)

            animator = UIViewPropertyAnimator(duration: 1, curve: .linear) { [unowned self] in self.effect = effect }
            animator.fractionComplete = intensity
        } else {
            super.init(effect: effect)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
}
