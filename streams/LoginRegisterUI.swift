//
//  LoginRegisterUI.swift
//  streams
//
//  Created by Anudeep Reddy on 27/01/26.
//

import UIKit

extension LoginRegisterViewController {

    // MARK: - Entry point
    func setupUI() {
        setupBackground()
        setupTextFields()
        setupNameTextField()
        setupSegment()
        setupButton()
        removeEmailTopConstraint()
        insertNameField()
    }

    // MARK: - Background
    private func setupBackground() {
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
    }

    // MARK: - Email & Password (ROUNDED FIX)
    private func setupTextFields() {
        let placeholderColor = UIColor.white.withAlphaComponent(0.6)

        emailTextField.attributedPlaceholder = NSAttributedString(
            string: "Email address",
            attributes: [.foregroundColor: placeholderColor]
        )

        passwordTextField.attributedPlaceholder = NSAttributedString(
            string: "Password",
            attributes: [.foregroundColor: placeholderColor]
        )

        [emailTextField, passwordTextField].forEach {
            guard let textField = $0 else { return }

            textField.textColor = .white
            textField.tintColor = .white
            textField.backgroundColor = UIColor.white.withAlphaComponent(0.12)

            
            textField.layer.cornerRadius = 10
            textField.layer.masksToBounds = true
            textField.clipsToBounds = true
            textField.borderStyle = .none

            textField.addLeftPadding()
        }

        emailTextField.keyboardType = .emailAddress
        emailTextField.autocapitalizationType = .none
        passwordTextField.isSecureTextEntry = true
    }

    // MARK: - Name field (already rounded, but normalized)
    private func setupNameTextField() {
        let placeholderColor = UIColor.white.withAlphaComponent(0.6)

        nameTextField.attributedPlaceholder = NSAttributedString(
            string: "Full name",
            attributes: [.foregroundColor: placeholderColor]
        )

        nameTextField.textColor = .white
        nameTextField.tintColor = .white
        nameTextField.backgroundColor = UIColor.white.withAlphaComponent(0.12)

        nameTextField.layer.cornerRadius = 10
        nameTextField.layer.masksToBounds = true
        nameTextField.clipsToBounds = true
        nameTextField.borderStyle = .none

        nameTextField.addLeftPadding()
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        nameTextField.alpha = 0
    }

    // MARK: - FIX: remove email top constraint from storyboard
    private func removeEmailTopConstraint() {
        guard let constraints = emailTextField.superview?.constraints else { return }

        for constraint in constraints {
            if constraint.firstItem as? UIView == emailTextField &&
               constraint.firstAttribute == .top {
                constraint.isActive = false
            }
        }
    }

    // MARK: - Insert name above email
    private func insertNameField() {
        guard let container = emailTextField.superview else { return }

        container.addSubview(nameTextField)

        NSLayoutConstraint.activate([
            nameTextField.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            nameTextField.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
            nameTextField.topAnchor.constraint(equalTo: container.topAnchor),
            nameTextField.heightAnchor.constraint(equalToConstant: 50),

            emailTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 16)
        ])
    }

    // MARK: - Segment
    private func setupSegment() {
        toggleSegment.selectedSegmentIndex = 0
    }

    // MARK: - Button
    private func setupButton() {
        loginButton.layer.cornerRadius = 25
        loginButton.clipsToBounds = true
        loginButton.setTitle("Login", for: .normal)
    }

    // MARK: - UI States
    func switchToLogin() {
        UIView.animate(withDuration: 0.25) {
            self.titleLabel.text = "Hello,\nWelcome Back!"
            self.subtitleLabel.text = "Please enter your details to continue"
            self.nameTextField.alpha = 0
            self.forgotPasswordLabel.alpha = 1
            self.loginButton.setTitle("Login", for: .normal)
            self.view.layoutIfNeeded()
        }
    }

    func switchToRegister() {
        UIView.animate(withDuration: 0.25) {
            self.titleLabel.text = "Let’s Create\nAccount"
            self.subtitleLabel.text = "Create an account to get started"
            self.nameTextField.alpha = 1
            self.forgotPasswordLabel.alpha = 0
            self.loginButton.setTitle("Register", for: .normal)
            self.view.layoutIfNeeded()
        }
    }
}

// MARK: - Padding Helper
extension UITextField {
    func addLeftPadding(_ padding: CGFloat = 16) {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: padding, height: 1))
        leftView = view
        leftViewMode = .always
    }
}
