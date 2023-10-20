//
//  CustomPopoverViewController.swift
//  My-Recipes-Book
//
//  Created by Kirill Taraturin on 19.10.2023.
//

import UIKit

final class CustomPopoverViewController: UIViewController {
    
    // MARK: - Private UI Properties
    private lazy var lineView: UIView = {
        var line = UIView()
        line.backgroundColor = .black
        line.transform = CGAffineTransform(scaleX: 1.0, y: 0.5)
        return line
    }()

    private lazy var editProfileButton: UIButton = {
        let changeProfileButton = createCustomButton(with: "Edit Profile", image: "Edit1")
        changeProfileButton.addTarget(self, action: #selector(buttonTouchDown), for: .touchDown)
        changeProfileButton.addTarget(self, action: #selector(buttonTouchUp), for: .touchUpInside)
        return changeProfileButton
    }()
    
    private lazy var logOutButton: UIButton = {
        var logButton = createCustomButton(with: "Log Out", image: "LogOut")
        logButton.addTarget(self, action: #selector(buttonTouchDown), for: .touchDown)
        logButton.addTarget(self, action: #selector(buttonTouchUp), for: .touchUpInside)
        return logButton
    }()

    // MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(lineView)
        view.addSubview(editProfileButton)
        view.addSubview(logOutButton)
        view.backgroundColor = .white
        setupConstraints()
    }
    
    // MARK: - Private Actions
    @objc private func buttonTouchDown(_ sender: UIButton) {
        if sender == logOutButton {
            logOutButton.backgroundColor = .systemGray4
        } else {
            editProfileButton.backgroundColor = .systemGray4
        }
    }
    
    @objc private func buttonTouchUp(_ sender: UIButton) {
        if sender == logOutButton {
            logOutButton.backgroundColor = .white
        } else {
            editProfileButton.backgroundColor = .white
        }
    }
    
    // MARK: - Private Methods
    private func setupConstraints() {
        lineView.snp.makeConstraints { make in
            make.centerY.equalTo(view.snp.centerY)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(1)
        }
        
        editProfileButton.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalTo(lineView.snp.top)
        }
        
        logOutButton.snp.makeConstraints { make in
            make.top.equalTo(lineView.snp.bottom)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    private func createCustomButton(with title: String, image: String) -> UIButton {
        let changeProfileButton = UIButton(type: .custom)
        
        let imageView = UIImageView()
        imageView.image = UIImage(named: image)
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .black
        
        let label = UILabel()
        label.text = title
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont.poppins(weight: .regular, size: 15)
        
        changeProfileButton.addSubview(label)
        changeProfileButton.addSubview(imageView)
        
        label.snp.makeConstraints { make in
            make.leading.equalTo(changeProfileButton.snp.leading).offset(15)
            make.centerY.equalTo(changeProfileButton.snp.centerY)
        }
        
        imageView.snp.makeConstraints { make in
            make.right.equalTo(changeProfileButton.snp.right).offset(-15)
            make.centerY.equalTo(changeProfileButton.snp.centerY)
            make.width.equalTo(18)
            make.height.equalTo(18)
        }
        
        return changeProfileButton
    }
}
