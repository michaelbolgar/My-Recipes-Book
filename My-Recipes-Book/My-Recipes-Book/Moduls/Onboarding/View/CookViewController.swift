//
//  CookViewController.swift
//  My-Recipes-Book
//
//  Created by Артур  Арсланов on 01.09.2023.
//

import UIKit
import SnapKit

class CookViewController: UIViewController {

    
    // MARK: - Image
    private let cookImage: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFill
        return view
    }()
    
    // MARK: - label
    private let cookLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont(name: "Poppins-Bold", size: 36)
        label.numberOfLines = 3
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var subView: [UIView] = [self.cookImage, self.cookLabel]
    
    // MARK: - Init
    
    init(cookWith: CooksHelper?){
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = UIColor.purple
        edgesForExtendedLayout = []
        
        cookImage.image = cookWith?.image
        cookLabel.text = cookWith?.name
        
        for view in subView { self.view.addSubview(view) }
        
        cookImage.snp.makeConstraints { make in
            
            make.bottom.equalToSuperview()
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        
        cookLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(-200)
            make.width.greaterThanOrEqualTo(150)
            make.width.lessThanOrEqualTo(250)
        }
        
        
//        NSLayoutConstraint.activate([
//            NSLayoutConstraint(item: cookImage, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 250),
//            NSLayoutConstraint(item: cookImage, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 250),
//            NSLayoutConstraint(item: cookImage, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 150),
//            NSLayoutConstraint(item: cookImage, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0)
//        ])
//
//        NSLayoutConstraint.activate([
//            NSLayoutConstraint(item: cookLabel, attribute: .top, relatedBy: .equal, toItem: cookImage, attribute: .bottom, multiplier: 1, constant: 50),
//            NSLayoutConstraint(item: cookLabel, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0)
//        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
