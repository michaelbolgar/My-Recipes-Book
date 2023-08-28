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

    private lazy var rulesLabel: UILabel = {
        let label = UILabel()
        label.text = "Game"
        label.textColor = .purple
        label.numberOfLines = 0
        label.font = UIFont(name: "Poppins-Bold", size: 32)
        return label
    }()

    //MARK: - UI Elements


    //MARK: - Init

    override init (frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = Palette.redPrimary80

        self.addSubview(rulesLabel)

        rulesLabel.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top).offset(200)
            make.centerX.equalToSuperview()
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //MARK: - Methods


    //MARK: - Extension

}
