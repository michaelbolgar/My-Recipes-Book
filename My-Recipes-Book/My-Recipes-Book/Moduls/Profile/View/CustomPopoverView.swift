//
//  CustomPopoverView.swift
//  My-Recipes-Book
//
//  Created by Kirill Taraturin on 20.10.2023.
//

import UIKit

final class CustomPopoverView: UIView {
    
    // MARK: - Closures
    var buttonTouchDown: ((UIButton) -> Void)?
    var buttonTouchUp: ((UIButton) -> Void)?
    
    // MARK: - Private UI Properties
    private lazy var lineView: UIView = {
        var line = UIView()
        line.backgroundColor = .black
        line.transform = CGAffineTransform(scaleX: 1.0, y: 0.5)
        return line
    }()
    
    private lazy var editProfileButton: UIButton = {
        let changeProfileButton = createCustomButton(
            with: "Edit Profile",
            image: "Edit1"
        )
        changeProfileButton.addTarget(
            self,
            action: #selector(touchDownButtonTapped),
            for: .touchDown
        )
        changeProfileButton.addTarget(
            self,
            action: #selector(touchUpButtonTapped),
            for: .touchUpInside
        )
        return changeProfileButton
    }()
    
    private lazy var logOutButton: UIButton = {
        var logButton = createCustomButton(with: "Log Out", image: "LogOut")
        logButton.addTarget(
            self,
            action: #selector(touchDownButtonTapped),
            for: .touchDown
        )
        logButton.addTarget(
            self, action: #selector(touchUpButtonTapped),
            for: .touchUpInside
        )
        return logButton
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Methods
    
    // MARK: - Private Actions
    @objc private func touchDownButtonTapped(_ sender: UIButton) {
        buttonTouchDown?(sender)
    }
    
    @objc private func touchUpButtonTapped(_ sender: UIButton) {
        buttonTouchUp?(sender)
    }
    
    // MARK: - Private methods
    private func setViews() {
        addSubview(lineView)
        addSubview(editProfileButton)
        addSubview(logOutButton)
        backgroundColor = .systemBackground
    }
    
    private func setupConstraints() {
        lineView.snp.makeConstraints { make in
            make.centerY.equalTo(self.snp.centerY)
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
    
    // MARK: - Create UI Methods
    private func createCustomButton(with title: String, image: String) -> UIButton {
        let button = UIButton(type: .custom)
        configureButton(button, with: title, image: image)
        return button
    }
    
    private func configureButton(_ button: UIButton, with title: String, image: String) {
        let label = createLabel(with: title)
        let imageView = createImageView(with: image)
        
        button.addSubview(label)
        button.addSubview(imageView)
        
        setupConstraintsFor(label: label, imageView: imageView, in: button)
    }
    
    private func createLabel(with title: String) -> UILabel {
        let label = UILabel()
        label.text = title
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont.poppins(weight: .regular, size: 15)
        return label
    }
    
    private func createImageView(with image: String) -> UIImageView {
        let imageView = UIImageView()
        imageView.image = UIImage(named: image)
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .black
        return imageView
    }
    
    private func setupConstraintsFor(label: UILabel, imageView: UIImageView, in button: UIButton) {
        label.snp.makeConstraints { make in
            make.leading.equalTo(button.snp.leading).offset(15)
            make.centerY.equalTo(button.snp.centerY)
        }
        
        imageView.snp.makeConstraints { make in
            make.right.equalTo(button.snp.right).offset(-15)
            make.centerY.equalTo(button.snp.centerY)
            make.width.equalTo(18)
            make.height.equalTo(18)
        }
    }
}
