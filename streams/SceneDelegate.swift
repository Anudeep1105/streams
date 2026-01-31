//
//  SceneDelegate.swift
//  streams
//
//  Created by Anudeep Reddy on 23/01/26.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    // MARK: - Cold Launch (App not running)
    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = scene as? UIWindowScene else { return }

        let window = UIWindow(windowScene: windowScene)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        // 🔥 HANDLE SIRI / DEEP LINK FIRST (COLD START)
        if let urlContext = connectionOptions.urlContexts.first {
            if handleDeepLink(urlContext.url, storyboard: storyboard, window: window) {
                self.window = window
                window.makeKeyAndVisible()
                return
            }
        }

        // 🔵 NORMAL APP FLOW
        let isLoggedIn = UserDefaults.standard.bool(forKey: "isLoggedIn")

        if isLoggedIn {
            let homeVC = storyboard.instantiateViewController(
                withIdentifier: "HomeViewController"
            )
            window.rootViewController = homeVC
        } else {
            let loginNav = storyboard.instantiateViewController(
                withIdentifier: "LoginNavController"
            )
            window.rootViewController = loginNav
        }

        self.window = window
        window.makeKeyAndVisible()
    }

    // MARK: - Warm Launch (App already running)
    func scene(
        _ scene: UIScene,
        openURLContexts URLContexts: Set<UIOpenURLContext>
    ) {
        guard
            let url = URLContexts.first?.url,
            let window = window
        else { return }

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        _ = handleDeepLink(url, storyboard: storyboard, window: window)
    }

    // MARK: - Deep Link Router (🔥 SINGLE SOURCE OF TRUTH)
    @discardableResult
    private func handleDeepLink(
        _ url: URL,
        storyboard: UIStoryboard,
        window: UIWindow
    ) -> Bool {

        guard url.scheme == "streams" else { return false }

        switch url.host {

        // 🔐 Forgot Password
        case "forgot-password":
            let forgotVC = storyboard.instantiateViewController(
                withIdentifier: "ForgotPasswordController"
            )
            let nav = UINavigationController(rootViewController: forgotVC)
            window.rootViewController = nav
            return true

        // 🏠 Home Tabs
        case "chats", "calls", "voicemail", "sms", "fax",
             "contacts", "dialpad", "smartbox", "connect":

            let homeVC = storyboard.instantiateViewController(
                withIdentifier: "HomeViewController"
            ) as! HomeViewController

            // 🔥 Tell HomeVC which tab to open
            homeVC.openTab = url.host


            window.rootViewController = homeVC
            return true

        default:
            return false
        }
    }
}

func sceneDidDisconnect(_ scene: UIScene) {
    // Called as the scene is being released by the system.
    // This occurs shortly after the scene enters the background, or when its session is discarded.
    // Release any resources associated with this scene that can be re-created the next time the scene connects.
    // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
}

func sceneDidBecomeActive(_ scene: UIScene) {
    // Called when the scene has moved from an inactive state to an active state.
    // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
}

func sceneWillResignActive(_ scene: UIScene) {
    // Called when the scene will move from an active state to an inactive state.
    // This may occur due to temporary interruptions (ex. an incoming phone call).
}

func sceneWillEnterForeground(_ scene: UIScene) {
    // Called as the scene transitions from the background to the foreground.
    // Use this method to undo the changes made on entering the background.
}

func sceneDidEnterBackground(_ scene: UIScene) {
    // Called as the scene transitions from the foreground to the background.
    // Use this method to save data, release shared resources, and store enough scene-specific state information
    // to restore the scene back to its current state.
}

