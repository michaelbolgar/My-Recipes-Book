//
//  CustomTabbarController.swift
//  My-Recipes-Book
//
//  Created by Михаил Болгар on 09.09.2023.
//

import UIKit

class CustomTabBarController: UITabBarController {
    
    //MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        generateViewController()
        setTabbarAppearance()
        setupMiddleButton()
    }
    
    //MARK: - Methods
    
    private func generateViewController() {
        //Home VC
        let homeVC = HomeViewController()
        let homeActiveImage = UIImage(named: "HomeActive")?.withRenderingMode(.alwaysOriginal)
        let homeInActiveImage = UIImage(named: "HomeInactive")?.withRenderingMode(.alwaysOriginal)
        let homeItem = UITabBarItem(title: nil, image: homeInActiveImage, selectedImage: homeActiveImage)
        homeVC.tabBarItem = homeItem
        let navigationHomeVC =  UINavigationController(rootViewController: homeVC)
        
        //Saved recipies VC
        let savedRecipiesVC = SavedRecipiesViewController()
        let bookmakrActiveImage = UIImage(named: "BookmarkActive")?.withRenderingMode(.alwaysOriginal)
        let bookmarkInactiveImage = UIImage(named: "BookmarkInactive")?.withRenderingMode(.alwaysOriginal)
        let savedRecipiesItem = UITabBarItem(title: nil, image: bookmarkInactiveImage, selectedImage: bookmakrActiveImage)
        savedRecipiesVC.tabBarItem = savedRecipiesItem
        let navigationSavedVC = UINavigationController(rootViewController: savedRecipiesVC)
        
        //Create recipe VC
        let createRecipeVC = NewRecipeViewController()
        createRecipeVC.view.backgroundColor = .systemBackground
        
        
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
            createRecipeVC,
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
    
    
    private func setTabbarAppearance() {
        tabBar.tintColor = .clear
        tabBar.unselectedItemTintColor = .clear
        view.backgroundColor = .systemBackground
        
        let shapeLayer = CAShapeLayer()
        let bezierPath = UIBezierPath()
        
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
        
        shapeLayer.fillColor = UIColor.systemBackground.cgColor
        shapeLayer.shadowColor = UIColor.black.cgColor
        shapeLayer.shadowOpacity = 0.1
        shapeLayer.shadowOffset = CGSize(width: 0, height: -3)
        shapeLayer.shadowRadius = 10
        
        tabBar.layer.insertSublayer(shapeLayer, at: 0)
        tabBar.isTranslucent = false
    }
    
    @objc private func middleButtonAction(sender: UIButton) {
        self.selectedIndex = 2
    }
}
