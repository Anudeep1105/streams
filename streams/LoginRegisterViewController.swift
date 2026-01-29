import UIKit

class LoginRegisterViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var forgotPasswordButton: UIButton!
    @IBOutlet weak var toggleSegment: UISegmentedControl!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    // Programmatic
    let nameTextField = UITextField()
    private var didSetupUI = false

    // MARK: - Lifecycle
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

    // MARK: - Segment
    @IBAction func toggleChanged(_ sender: UISegmentedControl) {
        sender.selectedSegmentIndex == 0
        ? switchToLogin()
        : switchToRegister()
    }

    // MARK: - Login Button
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        performLogin()
    }

    // MARK: - Shared Login/Register Logic
    func performLogin() {
        let name = nameTextField.text ?? ""
        let email = emailTextField.text ?? ""
        let password = passwordTextField.text ?? ""

        if toggleSegment.selectedSegmentIndex == 0 {
            print("LOGIN →", email, password)
        } else {
            print("REGISTER →", name, email, password)
        }

        // Navigate to Home
        performSegue(withIdentifier: "goToHome", sender: self)
    }
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(
            target: self,
            action: #selector(UIViewController.dismissKeyboard)
        )
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
extension LoginRegisterViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
