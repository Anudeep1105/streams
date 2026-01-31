//
//  ForgotPasswordController.swift
//  streams
//
//  Created by Anudeep Reddy on 29/01/26.
//

import UIKit

class ForgotPasswordController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        
    }
    
    private func setupUI() {
        // Match Login/Register background gradient
        // Remove existing gradient if any
        view.layer.sublayers?
            .filter { $0 is CAGradientLayer }
            .forEach { $0.removeFromSuperlayer() }
        
        let gradient = CAGradientLayer()
        gradient.colors = [
            UIColor(red: 15/255, green: 32/255, blue: 39/255, alpha: 1).cgColor,
            UIColor(red: 32/255, green: 58/255, blue: 67/255, alpha: 1).cgColor,
            UIColor(red: 44/255, green: 83/255, blue: 100/255, alpha: 1).cgColor
        ]
        gradient.locations = [0, 0.5, 1]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 1)
        gradient.frame = view.bounds
        
        view.layer.insertSublayer(gradient, at: 0)
        styleAllTextFields()
    }
    
    // Style all UITextFields to match Login/Register look
    private func styleAllTextFields() {
        let placeholderColor = UIColor.white.withAlphaComponent(0.6)
        let backgroundColor = UIColor.white.withAlphaComponent(0.12)
        
        for textField in findAllTextFields(in: view) {
            // Colors
            textField.textColor = .white
            textField.tintColor = .white
            textField.backgroundColor = backgroundColor
            
            // Rounded corners and no border
            textField.layer.cornerRadius = 10
            textField.layer.masksToBounds = true
            textField.clipsToBounds = true
            textField.borderStyle = .none
            
            // Placeholder (preserve existing if present)
            let current = textField.placeholder ?? ""
            if !current.isEmpty {
                textField.attributedPlaceholder = NSAttributedString(
                    string: current,
                    attributes: [.foregroundColor: placeholderColor]
                )
            }
            
            // Left padding
            addLeftPadding(to: textField)
        }
    }
    
    private func findAllTextFields(in root: UIView) -> [UITextField] {
        var result: [UITextField] = []
        if let tf = root as? UITextField { result.append(tf) }
        for sub in root.subviews { result.append(contentsOf: findAllTextFields(in: sub)) }
        return result
    }
    
    private func addLeftPadding(to textField: UITextField, _ padding: CGFloat = 16) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: padding, height: 1))
        textField.leftView = paddingView
        textField.leftViewMode = .always
    }
    
    
    
}
