import UIKit

class ForgotPasswordController: UIViewController {

    private let otpManager = OTPManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        GradientBackground.apply(to: view)
        hideKeyboardWhenTappedAround()
        otpManager.configure(in: view)
    }
}
