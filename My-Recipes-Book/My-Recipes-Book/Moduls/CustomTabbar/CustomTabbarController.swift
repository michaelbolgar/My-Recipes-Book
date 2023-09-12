//
//  CustomTabbarController.swift
//  My-Recipes-Book
//
//  Created by Михаил Болгар on 09.09.2023.
//

import Foundation
import UIKit

class CustomTabBarController: UITabBarController {
    
    //MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
        self.selectedIndex = 0
        
        generateViewController()
        setTabbar()
        setupMiddleButton()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        guard let items = self.tabBar.items else {return}
        for item in items {
            item.title = nil
        }
    }
    
    //MARK: - Methods
    private func getViewController(_ viewController: UIViewController, image: UIImage?) -> UIViewController {
        viewController.tabBarItem.image = image
        return viewController
    }
    
    private func generateViewController() {
        //Home VC
        let homeVC = HomeViewController()
        let navigationHomeVC =  UINavigationController(rootViewController: homeVC)
        let homeActiveImage = UIImage(named: "HomeActive")?.withRenderingMode(.alwaysOriginal)
        let homeInActiveImage = UIImage(named: "HomeInactive")?.withRenderingMode(.alwaysOriginal)
        let homeItem = UITabBarItem(title: nil, image: homeInActiveImage, selectedImage: homeActiveImage)
        homeVC.tabBarItem = homeItem
        
        //Saved recipies VC
        let savedRecipiesVC = SavedRecipiesViewController()
        let bookmakrActiveImage = UIImage(named: "BookmarkActive")?.withRenderingMode(.alwaysOriginal)
        let bookmarkInactiveImage = UIImage(named: "BookmarkInactive")?.withRenderingMode(.alwaysOriginal)
        let savedRecipiesItem = UITabBarItem(title: nil, image: bookmarkInactiveImage, selectedImage: bookmakrActiveImage)
        savedRecipiesVC.tabBarItem = savedRecipiesItem
        let navigationSavedVC = UINavigationController(rootViewController: savedRecipiesVC)
        
        //Notiffication VC
        let notificationVC = NotificationsViewController()
        let notificationActiveImage = UIImage(named: "NotificationActive")?.withRenderingMode(.alwaysOriginal)
        let notificationInactiveImage = UIImage(named: "NotificationInactive")?.withRenderingMode(.alwaysOriginal)
        let notificationsItem = UITabBarItem(title: nil, image: notificationInactiveImage, selectedImage: notificationActiveImage)
        notificationVC.tabBarItem = notificationsItem
        notificationVC.view.backgroundColor = .systemBackground
        
        //profile VC
        let profileVC = ProfileViewController()
        let profileActiveImage = UIImage(named: "ProfileActive")?.withRenderingMode(.alwaysOriginal)
        let profileInactiveImage = UIImage(named: "ProfileInactive")?.withRenderingMode(.alwaysOriginal)
        let profileItem = UITabBarItem(title: nil, image: profileInactiveImage, selectedImage: profileActiveImage)
        profileVC.tabBarItem = profileItem
        profileVC.view.backgroundColor = .systemBackground
        
        //set view controllers
        viewControllers = [
            navigationHomeVC,
            navigationSavedVC,
            NewRecipeViewController(),
            notificationVC, //have to be developed later
            profileVC //have to be developed later
        ]
    }
    
    private func setupMiddleButton() {
        let middleButton = UIButton(frame: CGRect (
            x: self.view.bounds.width / 2 - 30,
            y: -20,
            width: 60,
            height: 60))
        middleButton.setBackgroundImage(UIImage(named: "createRecipe"), for: .normal)
        
        self.tabBar.addSubview(middleButton)
        middleButton.addTarget(self, action: #selector(middleButtonAction), for: .touchUpInside)
        
        self.view.layoutIfNeeded()
    }
    
    
    private func setTabbar() {
        
        let shapeLayer = CAShapeLayer()
        let bezierPath = UIBezierPath()
        let whiteColor = UIColor.white.cgColor
        
        let frameWidth = self.tabBar.bounds.width
        let frameHeight = UIScreen.main.bounds.height - self.view.safeAreaInsets.bottom
        let holeWidth = 60 + 30 //middleButton.width + insets
        let holeHeight = 48
        let leftXUntilHole = Int(frameWidth/2) - Int(holeWidth/2)
        
        bezierPath.move(to: CGPoint (x: 0, y: 0))
        bezierPath.addLine(to: CGPoint(x: leftXUntilHole , y: 0))
        
        bezierPath.addCurve(to: CGPoint(
            x: leftXUntilHole + holeWidth / 2,
            y: holeHeight - 1),
                            controlPoint1: CGPoint(
                                x: leftXUntilHole + 15,
                                y: 15),
                            controlPoint2: CGPoint(
                                x: leftXUntilHole + 8,
                                y: holeHeight - 3))
        
        bezierPath.addCurve(to: CGPoint(
            x: leftXUntilHole + holeWidth,
            y: 0),
                            controlPoint1: CGPoint(
                                x: leftXUntilHole + holeWidth - 8,
                                y: holeHeight - 3),
                            controlPoint2: CGPoint(
                                x: leftXUntilHole + holeWidth - 15,
                                y: 15))
        
        bezierPath.addLine(to: CGPoint(x: frameWidth, y: 0))
        bezierPath.addLine(to: CGPoint(x: frameWidth, y: frameHeight))
        bezierPath.addLine(to: CGPoint(x: 0, y: frameHeight))
        bezierPath.addLine(to: CGPoint(x: 0, y: 0))
        bezierPath.close()
        
        shapeLayer.path = bezierPath.cgPath
        
        shapeLayer.fillColor = whiteColor
        shapeLayer.shadowColor = UIColor.black.cgColor
        shapeLayer.shadowOpacity = 0.1
        shapeLayer.shadowOffset = CGSize(width: 0, height: -3)
        shapeLayer.shadowRadius = 10
        
        tabBar.layer.insertSublayer(shapeLayer, at: 0)
        tabBar.isTranslucent = false
        
        //        tabBar.backgroundImage = UIImage.imageWithLayer(layer: shapeLayer)
    }
    
    @objc
    private func middleButtonAction(sender: UIButton) {
        self.selectedIndex = 2
    }
}

func createHomeViewController() -> UIViewController {
    let homeVC = HomeViewController()
    //homeVC.tabBarItem = UITabBarItem (title: "", image: UIImage(systemName: "house"), tag: 0)
    let navVC =  UINavigationController(rootViewController: homeVC)
    
    //
    //        let appearance = UINavigationBarAppearance()
    //        appearance.titleTextAttributes = [
    //            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 25, weight: .bold),
    //            NSAttributedString.Key.foregroundColor: UIColor(named: "purpleText") ?? .white
    //        ]
    //
    //        let leftBarButtonItem = UIBarButtonItem(
    //            image: UIImage(named: "arrow"),
    //            style: .done, target: self,
    //            action: #selector(backButtonTapped)
    //        )
    //
    //        leftBarButtonItem.tintColor = .black
    
    //        navigationItem.leftBarButtonItem = leftBarButtonItem
    //        navigationController?.navigationBar.standardAppearance = appearance
    //    }
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

//extension UIImage {
//    static func imageWithLayer(layer: CALayer) -> UIImage {
//        UIGraphicsBeginImageContextWithOptions(layer.frame.size, false, UIScreen.main.scale)
//        guard let context = UIGraphicsGetCurrentContext() else { return UIImage() }
//        layer.render(in: context)
//        guard let image = UIGraphicsGetImageFromCurrentImageContext() else { return UIImage() }
//        UIGraphicsEndImageContext()
//        return image
//    }
//}

extension CustomTabBarController: UITabBarControllerDelegate {
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        //code
    }
}
