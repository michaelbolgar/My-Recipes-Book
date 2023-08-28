//
//  HomeViewController.swift
//  My-Recipes-Book
//
//  Created by Михаил Болгар on 28.08.2023.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {
    
    private let homeView = HomeView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
        view.addSubview(homeView)
        homeView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
    }
}
