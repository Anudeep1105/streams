import AppIntents
import UIKit

@available(iOS 16.0, *)
struct OpenForgotPasswordIntent: AppIntent {

    static var title: LocalizedStringResource = "Open Forgot Password"
    static var openAppWhenRun: Bool = true

    func perform() async throws -> some IntentResult {

        await MainActor.run {
            if let url = URL(string: "streams://forgot-password") {
                UIApplication.shared.open(url)
            }
        }

        return .result()
    }
}
