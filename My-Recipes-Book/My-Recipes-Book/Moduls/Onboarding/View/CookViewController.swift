//
//  CookViewController.swift
//  My-Recipes-Book
//
//  Created by Артур  Арсланов on 01.09.2023.
//

import UIKit
import SnapKit

class CookViewController: UIViewController {

    let color = Palette.redPrimary80
    // MARK: - Image
    private let cookImage: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleToFill
        return view
    }()
    
    // MARK: - label
    private let cookLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont(name: "Poppins-Bold", size: 40)
        label.numberOfLines = 3
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.addTarget(self, action: #selector(nextButtonPressed), for: .touchUpInside)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.backgroundColor = color
        button.tintColor = .white
        button.layer.cornerRadius = 20
        return button
    }()
    
    private lazy var subButton: UIButton = {
        let button = UIButton(type: .system)
        button.addTarget(self, action: #selector(skipButtonPressed), for: .touchUpInside)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        button.backgroundColor = .clear
        button.tintColor = .white
        return button
    }()
    
    lazy var subView: [UIView] = [self.cookImage, self.cookLabel, self.nextButton,self.subButton]
    
    // MARK: - Init
    
    init(cookWith: CooksHelper?){
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = UIColor.purple
        edgesForExtendedLayout = []
        
        cookImage.image = cookWith?.image
        cookLabel.text = cookWith?.name
        nextButton.setTitle(cookWith?.buttonText, for: .normal)
        subButton.setTitle(cookWith?.subButton, for: .normal)
        
        for view in subView { self.view.addSubview(view) }
        
        cookImage.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.top.equalToSuperview()
//            make.leading.equalToSuperview()
//            make.trailing.equalToSuperview()
//            make.centerX.equalToSuperview()
            make.edges.equalToSuperview()
        }
        
        cookLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(-200)
            make.width.greaterThanOrEqualTo(200)
            make.width.lessThanOrEqualTo(320)
        }
        
        nextButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(-40)
            make.width.equalTo(193)
            make.height.equalTo(44)
        }
        
        subButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(nextButton).offset(45)
            make.width.equalTo(50)
            make.height.equalTo(30)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func nextButtonPressed() {
        
    }
    
    @objc func skipButtonPressed(){
        
    }
    
}
