//
//  EditProfileView.swift
//  My-Recipes-Book
//
//  Created by Kirill Taraturin on 24.10.2023.
//

import UIKit

final class EditProfileView: UIView {
    
    // MARK: - Closurse
    var didTapChangeButton: (() -> Void)?
    
    // MARK: - Private UI Properties
    // Header View
    private lazy var mainImageView: UIView = {
        var imageView = UIView()
        return imageView
    }()
    
    private lazy var profileImageView: UIImageView = {
        var image = UIImageView()
        image.image = UIImage(named: "user")
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 42.5
        image.clipsToBounds = true
        return image
    }()
    
    private lazy var editButton: UIButton = {
        var edit = UIButton(type: .system)
        edit.setImage(UIImage(named: "Edit1"), for: .normal)
        edit.backgroundColor = #colorLiteral(red: 0.9254901961, green: 0.9294117647, blue: 0.9450980392, alpha: 1)
        edit.layer.cornerRadius = 12.5
        edit.tintColor = .black
        edit.clipsToBounds = true
        edit.layer.borderColor = UIColor.white.cgColor
        edit.layer.borderWidth = 3
        edit.contentEdgeInsets = UIEdgeInsets(
            top: 5,
            left: 5,
            bottom: 5,
            right: 5
        )
        edit.addTarget(
            self,
            action: #selector(changeButtonDidTapped),
            for: .touchUpInside
        )
        return edit
    }()
    // Labels
    private lazy var nameLabel: UILabel = {
        var nameLabel = createCustomLabel(with: "First Name")
        return nameLabel
    }()
    
    private lazy var lastNameLabel: UILabel = {
        var lastNameLabel = createCustomLabel(with: "Last Name")
        return lastNameLabel
    }()
    
    private lazy var emailLabel: UILabel = {
        var emailLabel = createCustomLabel(with: "Email")
        return emailLabel
    }()
    
    // TextFeilds
    private lazy var nameTF: UITextField = {
        var nameTF = CustomTextField(fieldType: .withoutEyeButton, placeholder: "Enter your first name", border: true)
        return nameTF
    }()
    
    private lazy var lastNameTF: UITextField = {
        var nameTF = CustomTextField(fieldType: .withoutEyeButton, placeholder: "Enter your last name", border: true)
        return nameTF
    }()
    
    private lazy var emailTF: UITextField = {
        var emailTF = CustomTextField(fieldType: .withoutEyeButton, placeholder: "Enter you email", border: true)
        return emailTF
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
    
    // MARK: - Override Methods
    override func layoutSubviews() {
        super.layoutSubviews()
        profileImageView.layer.cornerRadius = profileImageView.layer.frame.height / 2
    }
    
    // MARK: - Public Methods
    func setProfileImage(_ image: UIImage) {
        profileImageView.image = image
    }
    
    // MARK: - Private Actions
    @objc private func changeButtonDidTapped() {
        didTapChangeButton?()
    }
    
    // MARK: - Private Methods
    private func setViews() {
        addSubview(mainImageView)
        mainImageView.addSubview(profileImageView)
        mainImageView.addSubview(editButton)
        addSubview(nameTF)
        addSubview(nameLabel)
        addSubview(lastNameLabel)
        addSubview(lastNameTF)
        addSubview(emailLabel)
        addSubview(emailTF)
    }
    
    private func setupConstraints() {
        
        mainImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.centerX.equalToSuperview()
            make.width.equalTo(120)
            make.height.equalTo(120)
        }
        
        profileImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(0)
            make.left.equalToSuperview().offset(0)
            make.right.equalToSuperview().offset(0)
            make.bottom.equalToSuperview().offset(0)
        }
        
        editButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-2)
            make.right.equalToSuperview().offset(-2)
            make.height.equalTo(25)
            make.width.equalTo(25)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(mainImageView.snp.bottom).offset(40)
            make.left.equalToSuperview().offset(20)
        }
        
        nameTF.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(5)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-16)
            make.height.equalTo(50)
        }
        
        lastNameLabel.snp.makeConstraints { make in
            make.top.equalTo(nameTF.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(20)
        }
        
        lastNameTF.snp.makeConstraints { make in
            make.top.equalTo(lastNameLabel.snp.bottom).offset(5)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-16)
            make.height.equalTo(50)
        }
        
        emailLabel.snp.makeConstraints { make in
            make.top.equalTo(lastNameTF.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(20)
        }
        
        lastNameTF.snp.makeConstraints { make in
            make.top.equalTo(emailTF.snp.bottom).offset(5)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-16)
            make.height.equalTo(50)
        }
        
    }
}

// MARK: - Create UI Methods
extension EditProfileView {
    private func createCustomLabel(with title: String) -> UILabel {
        let customLabel = UILabel()
        customLabel.text = title
        customLabel.font = UIFont.poppins(weight: .regular, size: 16)
        customLabel.textColor = UIColor.systemGray
        return customLabel
    }
}
