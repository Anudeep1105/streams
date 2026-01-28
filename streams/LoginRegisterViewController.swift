//
//  ViewController.swift
//  streams
//
//  Created by Anudeep Reddy on 23/01/26.
//

import UIKit

class LoginRegisterViewController: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var forgotPasswordLabel: UILabel!
    @IBOutlet weak var toggleSegment: UISegmentedControl!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    // MARK: - Programmatic UI
    let nameTextField = UITextField()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()          // from UI file
        switchToLogin()    // default state
    }
    
    @IBAction func toggleChanged(_ sender: UISegmentedControl) {
        sender.selectedSegmentIndex == 0
        ? switchToLogin()
        : switchToRegister()
    }
    // MARK: - Actions
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        let name = nameTextField.text ?? ""
        let email = emailTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        
        if toggleSegment.selectedSegmentIndex == 0 {
            print("LOGIN →", email, password)
        } else {
            print("REGISTER →", name, email, password)
        }
    }
}

