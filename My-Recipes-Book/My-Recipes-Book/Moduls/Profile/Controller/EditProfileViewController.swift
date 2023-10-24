//
//  EditProfileViewController.swift
//  My-Recipes-Book
//
//  Created by Kirill Taraturin on 20.10.2023.
//

import UIKit

final class EditProfileViewController: UIViewController {
    
    // MARK: - Private UI Properties
    private let editProfileView = EditProfileView()

    // MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
        setupConstraints()
        view.backgroundColor = .white
        title = "Edit Profile"
    }
    
    // MARK: - Private Methods
    private func setViews() {
        view.addSubview(editProfileView)
    }
    
    private func setupConstraints() {
        editProfileView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
}
