//
//  ProfileHeaderView.swift
//  My-Recipes-Book
//
//  Created by Михаил Болгар on 14.09.2023.
//

import Foundation
import UIKit
import SnapKit

class ProfileHeaderView: UIView {

    //MARK: - Properties

    private lazy var screenWidth = UIScreen.main.bounds.width
    private lazy var photoSize: CGFloat = screenWidth / 3

    //MARK: - UI Elements

    private lazy var userPhotoImageView: UIImageView = {
        let defaultImage = UIImage(named: "defaultUserPhoto")

        $0.layer.cornerRadius = photoSize / 2
        $0.layer.borderColor = UIColor.systemGray2.cgColor
        $0.layer.borderWidth = 3
        $0.contentMode = .scaleAspectFit
        $0.clipsToBounds = true
        $0.image = defaultImage
        return $0
    }(UIImageView())

    private lazy var userName: UILabel = {
        let userName = UILabel()
        $0.text = "User Name"
        $0.textColor = UIColor.label
        $0.font = UIFont.boldSystemFont(ofSize: 18)
        return $0
    }(UILabel())

    //MARK: - Init
    
    override init (frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .green
        layout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //MARK: - Methods

    private func layout() {

        [userPhotoImageView, userName].forEach { addSubview($0) }

        userPhotoImageView.snp.makeConstraints { make in
            make.leading.equalTo(self.snp.leading).offset(15)
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(15)
        }

        userName.snp.makeConstraints { make in
            make.leading.equalTo(userPhotoImageView.snp.trailing).offset(15)
            make.top.equalTo(userPhotoImageView.snp.top)
        }
    }
}
