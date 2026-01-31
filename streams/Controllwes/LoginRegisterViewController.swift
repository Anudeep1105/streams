import UIKit

class LoginRegisterViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var forgotPasswordButton: UIButton!
    @IBOutlet weak var toggleSegment: UISegmentedControl!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    let nameTextField = UITextField()
    private var didSetupUI = false

    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        if !didSetupUI {
            setupUI()
            switchToLogin()
            didSetupUI = true
        }
    }

    @IBAction func toggleChanged(_ sender: UISegmentedControl) {
        sender.selectedSegmentIndex == 0
        ? switchToLogin()
        : switchToRegister()
    }

    @IBAction func loginButtonTapped(_ sender: UIButton) {
        UserDefaults.standard.set(true, forKey: "isLoggedIn")
        performLogin()
    }

    private func performLogin() {
        let email = emailTextField.text ?? ""
        let password = passwordTextField.text ?? ""

        print("LOGIN →", email, password)
        performSegue(withIdentifier: "goToHome", sender: self)
    }
}
