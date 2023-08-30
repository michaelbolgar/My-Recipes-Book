//
//  OnboardingViewController.swift
//  My-Recipes-Book
//
//  Created by Михаил Болгар on 28.08.2023.
//

import Foundation
import UIKit

class OnboardingViewController: UIViewController {

    //MARK: - Properties
//    var startPageView = UIImageView()
//    let startPageImage = UIImage(named: "startPage")
    let onboardingView = OnboardingView()


    //MARK: - Init

    override func viewDidLoad() {
        super.viewDidLoad()
        
        layout()
//        setupImage()
    }

    //MARK: - Methods

    private func layout() {
        view.addSubview(onboardingView)
        
        NSLayoutConstraint.activate([

            onboardingView.topAnchor.constraint(equalTo: view.topAnchor),
            onboardingView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            onboardingView.widthAnchor.constraint(equalTo: view.widthAnchor),
            onboardingView.bottomAnchor.constraint(equalTo: view.bottomAnchor)

            ])
    }
    
//    private func setupImage() {
//        startPageView = UIImageView(image: startPageImage)
//        startPageView.contentMode = .scaleAspectFill
//
//        view.addSubview(startPageView)
//
//        startPageView.translatesAutoresizingMaskIntoConstraints = false
//
//        NSLayoutConstraint.activate([
//
//            startPageView.topAnchor.constraint(equalTo: view.topAnchor),
//            startPageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
//            startPageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            startPageView.widthAnchor.constraint(equalTo: view.widthAnchor)
//
//        ])
//    }
}
