//
//  ProfileViewController.swift
//  My-Recipes-Book
//
//  Created by Михаил Болгар on 02.09.2023.
//

import Foundation
import UIKit

class ProfileViewController: UIViewController {

    //MARK: - Properties

    let profileView = ProfileView()

    //MARK: - Init

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        layout()
    }

    //MARK: - Methods

    private func layout() {

        view.addSubview(profileView)
        
        profileView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
