//
//  UIView+Extention.swift
//  Demo-App
//
//  Created by Abdeltwab on 12/21/20.
//

import UIKit

extension UIView {
    
    func blur(withStyle style: UIBlurEffect.Style = .light) {
        let blurEffect = UIBlurEffect(style: style)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        insertSubview(blurEffectView, at: 0)
        clipsToBounds = true
    }
}
