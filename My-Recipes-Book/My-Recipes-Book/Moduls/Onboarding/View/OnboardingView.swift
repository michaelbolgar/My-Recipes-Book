//
//  OnboardingView.swift
//  My-Recipes-Book
//
//  Created by Михаил Болгар on 28.08.2023.
//

import Foundation
import UIKit
import SnapKit

class OnboardingView: UIView {

    //MARK: - Properties

    let color = Palette.redPrimary80
    var getStartedButtonPressedHandler: (() -> Void)?
    
    
    private lazy var stackViewLabel: UIStackView = {
        let stack = UIStackView()
        stack.addArrangedSubview(iconRatingLabel)
        stack.addArrangedSubview(ratingLabel)
        stack.addArrangedSubview(secondRatingLabel)
        return stack
    }()
    
    private lazy var ratingLabel: UILabel = {
        let label = UILabel()
        label.text = "  100k+"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    private lazy var secondRatingLabel: UILabel = {
        let label = UILabel()
        label.text = "Premium recipes"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    private lazy var iconRatingLabel: UIImageView = {
        let icon = UIImageView()
        icon.image = UIImage(systemName: "star.fill")
        icon.tintColor = .black
        icon.translatesAutoresizingMaskIntoConstraints = false
        return icon
    }()
    
    
    
    private var startPageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "startPage")
        return imageView
    }()

    private lazy var mainLabel: UILabel = {
        let label = UILabel()
        label.text = "Best Recipe"
        label.textColor = .white
        label.numberOfLines = 2
        label.textAlignment = .center
        label.font = UIFont(name: "Poppins-Bold", size: 56)
        return label
    }()
    
    private lazy var secondLabel: UILabel = {
        let label = UILabel()
        label.text = "Find best recipes for cooking"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20)
        
        return label
    }()
    
    
    
    private lazy var getStartedButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Get started", for: .normal)
        button.addTarget(self, action: #selector(getStartedButtonPressed), for: .touchUpInside)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.backgroundColor = color
        button.tintColor = .white
        button.layer.cornerRadius = 10
        
        
        return button
    }()
    
    

    //MARK: - UI Elements

    @objc private func getStartedButtonPressed() {
        getStartedButtonPressedHandler?()
    }
    
    //MARK: - Init

    override init (frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .lightGray
        
        self.addSubview(startPageView)
        self.addSubview(stackViewLabel)
        self.addSubview(mainLabel)
        self.addSubview(secondLabel)
        self.addSubview(getStartedButton)
        
        
        stackViewLabel.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top).offset(60)
            make.centerX.equalToSuperview()
        }
        
        iconRatingLabel.snp.makeConstraints { make in
            make.width.lessThanOrEqualTo(18)
            make.height.lessThanOrEqualTo(18)
        }
        
        mainLabel.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top).offset(480)
            make.centerX.equalToSuperview()
            
            make.width.greaterThanOrEqualTo(100)
            make.width.lessThanOrEqualTo(200)
        }
        
        secondLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(mainLabel.snp.top).offset(170)
        }
        
        startPageView.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top)
            make.bottom.equalTo(self.snp.bottom)
            make.leading.equalTo(self.snp.leading)
            make.trailing.equalTo(self.snp.trailing)
        }
        
        getStartedButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(-90)
            make.width.equalTo(156)
            make.height.equalTo(56)
        }
        
        
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

//    MARK: - Methods

}

//MARK: - Extension
