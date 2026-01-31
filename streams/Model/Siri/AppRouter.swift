//
//  AppRouter.swift
//  streams
//
//  Created by Anudeep Reddy on 31/01/26.
//

import UIKit

class AppRouter {

    static let shared = AppRouter()
    private init() {}

    func openForgotPassword() {
        guard
            let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
            let window = windowScene.windows.first
        else { return }

        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        let forgotVC = storyboard.instantiateViewController(
            withIdentifier: "ForgotPasswordController"
        )

        let nav = UINavigationController(rootViewController: forgotVC)
        nav.modalPresentationStyle = .fullScreen

        window.rootViewController = nav
        window.makeKeyAndVisible()
    }
}
