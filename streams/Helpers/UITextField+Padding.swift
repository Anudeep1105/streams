//
//  UITextField+Padding.swift
//  streams
//
//  Created by Anudeep Reddy on 30/01/26.
//

import UIKit

extension UITextField {
    func addLeftPadding(_ padding: CGFloat = 16) {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: padding, height: 1))
        leftView = view
        leftViewMode = .always
    }
}
