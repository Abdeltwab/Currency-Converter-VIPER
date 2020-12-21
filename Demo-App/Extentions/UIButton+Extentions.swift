//
//  UIButton+Extentions.swift
//  Demo-App
//
//  Created by Abdeltwab on 12/21/20.
//

import UIKit


extension UIButton {
    
    private var states: [UIControl.State] {
        return [.normal, .selected, .highlighted, .disabled]
    }
    
    func setImageForAllStates(_ image: UIImage) {
        states.forEach { setImage(image, for: $0) }
    }
}
