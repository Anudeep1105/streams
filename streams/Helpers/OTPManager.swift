//
//  OTPManager.swift
//  streams
//
//  Created by Anudeep Reddy on 30/01/26.
import UIKit

final class OTPManager: NSObject, UITextFieldDelegate {

    private var otpFields: [UITextField] = []

    func configure(in view: UIView) {
        otpFields = findOTPFields(in: view)

        for (index, field) in otpFields.enumerated() {
            field.delegate = self
            field.tag = index
            field.keyboardType = .numberPad
            field.textAlignment = .center
            field.addTarget(
                self,
                action: #selector(editingChanged(_:)),
                for: .editingChanged
            )
        }
    }

    @objc private func editingChanged(_ textField: UITextField) {
        if let text = textField.text, text.count > 1 {
            textField.text = String(text.prefix(1))
        }

        let nextIndex = textField.tag + 1
        if nextIndex < otpFields.count {
            otpFields[nextIndex].becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
    }

    private func findOTPFields(in root: UIView) -> [UITextField] {
        var result: [UITextField] = []
        if let tf = root as? UITextField {
            result.append(tf)
        }
        for sub in root.subviews {
            result.append(contentsOf: findOTPFields(in: sub))
        }
        return Array(result.prefix(4))
    }
}
