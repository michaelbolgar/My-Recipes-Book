//
//  MainImageCell.swift
//  My-Recipes-Book
//
//  Created by Kirill Taraturin on 28.08.2023.
//

import UIKit
import SnapKit

class MainImageCell: UITableViewCell {
    
    // MARK: - UI Properties
    lazy var mainImageView: UIImageView = {
        var mainImage = UIImageView()
        mainImage.image = UIImage(named: "DishImage")
        mainImage.translatesAutoresizingMaskIntoConstraints = false
        mainImage.layer.cornerRadius = 10
        mainImage.clipsToBounds = true
        return mainImage
    }()
    
    lazy var starImageView: UIImageView = {
        var starImageView = UIImageView()
        starImageView.image = UIImage(systemName: "star.fill")
        starImageView.tintColor = .black
        starImageView.translatesAutoresizingMaskIntoConstraints = false
        return starImageView
    }()
    
    lazy var ratingLabel: UILabel = {
        var ratingLabel = UILabel()
        ratingLabel.text = "4,5"
        ratingLabel.font = UIFont.boldSystemFont(ofSize: 16)
        ratingLabel.textColor = .black
        return ratingLabel
    }()
    
    lazy var reviewsLabel: UILabel = {
        var reviewsLabel = UILabel()
        reviewsLabel.text = "(300 Reviews)"
        reviewsLabel.textColor = #colorLiteral(red: 0.5686274767, green: 0.5686274767, blue: 0.5686274767, alpha: 1)
        return reviewsLabel
    }()
    
    lazy var ratingStackView: UIStackView = {
        var ratingStackView = UIStackView()
        ratingStackView.spacing = 8
        ratingStackView.alignment = .fill
        ratingStackView.distribution = .equalSpacing
        ratingStackView.addArrangedSubview(starImageView)
        ratingStackView.addArrangedSubview(ratingLabel)
        ratingStackView.addArrangedSubview(reviewsLabel)
        return ratingStackView
    }()
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(mainImageView)
        contentView.addSubview(ratingStackView)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    private func setupConstraints() {
        // setup constraints to mainImage
        mainImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.height.equalTo(190)
        }
        
        // setup constraints to ratingStackView
        ratingStackView.snp.makeConstraints { make in
            make.top.equalTo(mainImageView.snp.bottom).offset(15)
            make.left.equalToSuperview().offset(16)
        }
    }
}
