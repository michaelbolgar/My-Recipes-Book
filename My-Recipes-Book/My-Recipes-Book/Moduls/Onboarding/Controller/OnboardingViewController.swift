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
    let onboardingView = OnboardingView()

    //MARK: - Init

    override func viewDidLoad() {
        super.viewDidLoad()
        
        layout()
        onboardingView.getStartedButtonPressedHandler = { [weak self] in
            let pageVC = PageViewController()
            self?.navigationController?.pushViewController(pageVC, animated: true)
        }
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
}
