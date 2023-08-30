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
        label.font = UIFont(name: "Poppins-Bold", size: 50)
        return label
    }()
    
    private lazy var secondLabel: UILabel = {
        let label = UILabel()
        label.text = "Find best recipes for cooking"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 17)
        
        return label
    }()
    
    private lazy var ratingLabel: UILabel = {
        let label = UILabel()
        
        
        label.text = "100k+ Premium recipes."
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 17)
        
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
        
    }
    
    //MARK: - Init

    override init (frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .lightGray
        

        self.addSubview(startPageView)
        self.addSubview(mainLabel)
        self.addSubview(secondLabel)
        self.addSubview(ratingLabel)
        self.addSubview(getStartedButton)
        
        
        mainLabel.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top).offset(471)
            make.centerX.equalToSuperview()
            
            make.width.greaterThanOrEqualTo(100)
            make.width.lessThanOrEqualTo(200)
        }
        
        secondLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(mainLabel.snp.top).offset(150)
        }
        
        ratingLabel.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top).offset(100)
            make.centerX.equalToSuperview()
        }
        
        startPageView.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top)
            make.bottom.equalTo(self.snp.bottom)
            make.leading.equalTo(self.snp.leading)
            make.trailing.equalTo(self.snp.trailing)
        }
        
        getStartedButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(-70)
            make.width.equalTo(274)
            make.height.equalTo(79)
            
            make.size.equalTo(CGSize(width: 156, height: 56))
        }
        
        
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

//    MARK: - Methods

    


    //MARK: - Extension

    
    
}
