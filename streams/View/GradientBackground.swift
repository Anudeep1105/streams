//
//  GradientBackground.swift
//  streams
//
//  Created by Anudeep Reddy on 30/01/26.
//

import UIKit

struct GradientBackground {

    static func apply(to view: UIView) {
        let gradient = CAGradientLayer()
        gradient.colors = [
            UIColor(red: 15/255, green: 32/255, blue: 39/255, alpha: 1).cgColor,
            UIColor(red: 32/255, green: 58/255, blue: 67/255, alpha: 1).cgColor,
            UIColor(red: 44/255, green: 83/255, blue: 100/255, alpha: 1).cgColor
        ]
        gradient.frame = view.bounds
        view.layer.insertSublayer(gradient, at: 0)
    }
}
