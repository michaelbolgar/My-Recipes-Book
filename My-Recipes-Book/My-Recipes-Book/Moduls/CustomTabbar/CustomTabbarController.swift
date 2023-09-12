//
//  CustomTabbarController.swift
//  My-Recipes-Book
//
//  Created by Михаил Болгар on 09.09.2023.
//

import Foundation
import UIKit

class CustomTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.delegate = self
        self.selectedIndex = 0

        generateViewController()
        setTabbar()
        setupMiddleButton()
    }

    private func getViewController(_ viewController: UIViewController, image: UIImage?) -> UIViewController {
        viewController.tabBarItem.image = image
        return viewController
    }

    private func generateViewController() {
        
        
        viewControllers = [
            getViewController(createHomeViewController(), image: UIImage (named: "HomeInactive")),
            getViewController(SavedViewController(), image: UIImage (named: "BookmarkInactive")),
            getViewController(NewRecipeViewController(), image: UIImage (named: "")),
            getViewController(ProfileViewController(), image: UIImage (named: "NotificationInactive")), //заглушка на первое время
            getViewController(ProfileViewController(), image: UIImage (named: "ProfileInactive")) //заглушка на первое время
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

func createSavedViewController() -> UIViewController {
    let savedVC = SavedViewController()
    savedVC.tabBarItem = UITabBarItem (title: "", image: UIImage(systemName: "bookmark"), tag: 1)
    return UINavigationController(rootViewController: savedVC)
}

func createDetailsViewController() -> UIViewController {
    let detailsVC = DetailsViewController()
    detailsVC.tabBarItem = UITabBarItem (title: "", image: UIImage(systemName: "bell"), tag: 2)
    //return UINavigationController(rootViewController: detailsVC)
    return detailsVC
}

func createProfileViewController() -> UIViewController {
    let profileVC = ProfileViewController()
    profileVC.tabBarItem = UITabBarItem (title: "", image: UIImage(systemName: "person"), tag: 3)
    //return UINavigationController(rootViewController: profileVC)
    return profileVC
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
