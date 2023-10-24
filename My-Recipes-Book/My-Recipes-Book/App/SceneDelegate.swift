import UIKit
import FirebaseAuth

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)

        let isOnboardingCompleted = AppSettingsManager.isOnboardingCompleted()

//        if isOnboardingCompleted {
//            let mainVC = createLoginViewController()
//            window.rootViewController = mainVC
//        } else {
//            let onboardingVC = OnboardingViewController()
//            window.rootViewController = onboardingVC
//        }

        if isOnboardingCompleted {
            if let _ = Auth.auth().currentUser {
                let tabbar = CustomTabBarController()
                let navigationController = UINavigationController(rootViewController: tabbar)
                navigationController.navigationBar.isHidden = true
                navigationController.navigationBar.setBackgroundImage(UIImage(), for: .default)
                navigationController.navigationBar.shadowImage = UIImage()
                window.rootViewController = navigationController
            } else {
                let loginVC = LoginViewController()
                let navigationController = UINavigationController(rootViewController: loginVC)
                navigationController.navigationBar.isHidden = true
                navigationController.navigationBar.setBackgroundImage(UIImage(), for: .default)
                navigationController.navigationBar.shadowImage = UIImage()
                window.rootViewController = navigationController
            }
        } else {
            let onboardingVC = OnboardingViewController()
            let navigationController = UINavigationController(rootViewController: onboardingVC)
            navigationController.navigationBar.isHidden = true
            navigationController.navigationBar.setBackgroundImage(UIImage(), for: .default)
            navigationController.navigationBar.shadowImage = UIImage()
            window.rootViewController = navigationController
        }
        
//        let loginVC = LoginViewController()
//        let navigationController = UINavigationController(rootViewController: loginVC)
//        navigationController.navigationBar.isHidden = true
//        navigationController.navigationBar.setBackgroundImage(UIImage(), for: .default)
//        navigationController.navigationBar.shadowImage = UIImage()
//        window.rootViewController = navigationController

//        window.rootViewController = createLoginViewController()
//        window.rootViewController = createAccountVC()
        self.window = window
        window.makeKeyAndVisible()

//        let navigationController = UINavigationController(rootViewController: onboardingVC)
//        window.rootViewController = PageViewController()
    }

    func createLoginViewController() -> UINavigationController {
        let loginVC = LoginViewController()
        return UINavigationController(rootViewController: loginVC)
    }

    func createAccountVC() -> UINavigationController {
        let createAccountVC = CreateAccountVC()
        return UINavigationController(rootViewController: createAccountVC)
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

