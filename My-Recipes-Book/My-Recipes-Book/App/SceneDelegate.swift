//
//  SceneDelegate.swift
//  My-Recipes-Book
//
//  Created by Михаил Болгар on 28.08.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = (scene as? UIWindowScene) else { return }

        let window = UIWindow(windowScene: windowScene)
        let isOnboardingCompleted = AppSettingsManager.isOnboardingCompleted()

        if isOnboardingCompleted {
            let mainVC = CustomTabBarController()
            let navigationController = UINavigationController(rootViewController: mainVC)
            window.rootViewController = navigationController
        } else {
            let onboardingVC = OnboardingViewController()
            let navigationController = UINavigationController(rootViewController: onboardingVC)
            window.rootViewController = navigationController
        }

        window.makeKeyAndVisible()

        self.window = window
    }

    func createTabBarController() -> UITabBarController {
        let tabbarController = UITabBarController()
        tabbarController.tabBar.backgroundColor = .cyan
        tabbarController.viewControllers = [
            createHomeViewController(),
            createSavedViewController(),
            createDetailsViewController(),
            createProfileViewController()
        ]

        return tabbarController
    }

    func createHomeViewController() -> UINavigationController {
        let homeVC = HomeViewController()
        homeVC.tabBarItem = UITabBarItem (title: "", image: UIImage(systemName: "house"), tag: 0)
        let navVC =  UINavigationController(rootViewController: homeVC)
//
//            let leftBarButtonItem = UIBarButtonItem(
//                image: UIImage(named: "arrow"),
//                style: .done, target: self,
//                action: #selector(backButtonTapped)
//            )
//
//            leftBarButtonItem.tintColor = .black
//
//            navigationItem.leftBarButtonItem = leftBarButtonItem
//        }
        
        return navVC
    }

    func createSavedViewController() -> UINavigationController {
        let savedVC = SavedViewController()
        savedVC.tabBarItem = UITabBarItem (title: "", image: UIImage(systemName: "bookmark"), tag: 1)
        return UINavigationController(rootViewController: savedVC)
    }

    func createDetailsViewController() -> UINavigationController {
        let detailsVC = DetailsViewController()
        detailsVC.tabBarItem = UITabBarItem (title: "", image: UIImage(systemName: "bell"), tag: 2)
        return UINavigationController(rootViewController: detailsVC)
    }

    func createProfileViewController() -> UINavigationController {
        let profileVC = ProfileViewController()
        profileVC.tabBarItem = UITabBarItem (title: "", image: UIImage(systemName: "person"), tag: 3)
        return UINavigationController(rootViewController: profileVC)
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


}

