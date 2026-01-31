//
//  UIButton+Highlight.swift
//  streams
//
//  Created by Anudeep Reddy on 30/01/26.
//

import UIKit

extension UIButton {
    func setSelectedStyle() {
        tintColor = .white
    }

    func setUnselectedStyle() {
        tintColor = UIColor.white.withAlphaComponent(0.5)
    }
}
