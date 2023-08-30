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

    
    
    private var startPageImage: UIImage {
        var image = UIImage()
        image = UIImage(named: "startPage")!
        return image
    }
    
    private var startPageView: UIImageView {
        let imageView = UIImageView(image: startPageImage)
        imageView.contentMode = .center
        
        return imageView
    }
    
    
    
    private lazy var rulesLabel: UILabel = {
        let label = UILabel()
        label.text = "Best Recipe"
        label.textColor = .white
        label.numberOfLines = 0
        label.font = UIFont(name: "Poppins-Bold", size: 32)
        return label
    }()
    
    

    //MARK: - UI Elements


    //MARK: - Init

    override init (frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .red

        self.addSubview(rulesLabel)
        self.addSubview(startPageView)
       

        rulesLabel.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top).offset(471)
            make.centerX.equalToSuperview()
        }
        
        startPageView.snp.makeConstraints { make in
            make.top.equalTo(rulesLabel.snp.top).offset(50)
//            make.bottom.equalTo(self.snp.bottom)
//            make.leading.equalTo(self.snp.leading)
//            make.trailing.equalTo(self.snp.trailing)
        }
        
        
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //MARK: - Methods

//    private func setupImage() {
//        startPageView.translatesAutoresizingMaskIntoConstraints = false
//
//                NSLayoutConstraint.activate([
//
//                    startPageView.topAnchor.constraint(equalTo: view.topAnchor),
//                    startPageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
//                    startPageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//                    startPageView.widthAnchor.constraint(equalTo: view.widthAnchor)
//
//                ])
//    }

    //MARK: - Extension

}
