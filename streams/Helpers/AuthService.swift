import Foundation
final class AuthService {

    static let shared = AuthService()
    private init() {}

    private let key = "isLoggedIn"

    func login() {
        UserDefaults.standard.set(true, forKey: key)
    }

    func logout() {
        UserDefaults.standard.removeObject(forKey: key)
    }

    func isLoggedIn() -> Bool {
        UserDefaults.standard.bool(forKey: key)
    }
}

