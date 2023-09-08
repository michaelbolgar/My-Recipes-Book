//
//  CustomTabBar.swift
//  My-Recipes-Book
//
//  Created by Михаил Болгар on 05.09.2023.
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
            getViewController(HomeViewController(), image: UIImage (named: "HomeInactive")),
            getViewController(SavedViewController(), image: UIImage (named: "BookmarkInactive")),
            getViewController(TrendingViewController(), image: UIImage (named: "")), //изменить после мёрджа
            getViewController(DetailsViewController(), image: UIImage (named: "NotificationInactive")), //изменить после мёрджа
            getViewController(ProfileViewController(), image: UIImage (named: "ProfileInactive"))
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
        let centerWidth = self.view.frame.width / 2

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
