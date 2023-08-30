//
//  MainImageCell.swift
//  My-Recipes-Book
//
//  Created by Kirill Taraturin on 28.08.2023.
//

import UIKit
import SnapKit

final class MainImageCell: UITableViewCell {
    
    // MARK: - Public UI Properties
    lazy var mainImageView: UIImageView = {
        var mainImage = UIImageView()
        mainImage.layer.cornerRadius = 10
        mainImage.clipsToBounds = true
        return mainImage
    }()
    
    lazy var ratingLabel: UILabel = {
        var ratingLabel = UILabel()
        ratingLabel.text = "4,5"
        ratingLabel.font = UIFont(name: "Poppins-Bold", size: 17)
        ratingLabel.textColor = .black
        return ratingLabel
    }()
    
    lazy var reviewsLabel: UILabel = {
        var reviewsLabel = UILabel()
        reviewsLabel.text = "(300 Reviews)"
        reviewsLabel.textColor = #colorLiteral(red: 0.5686274767, green: 0.5686274767, blue: 0.5686274767, alpha: 1)
        return reviewsLabel
    }()
    
    // MARK: - Private UI Properties
    private lazy var starImageView: UIImageView = {
        var starImageView = UIImageView()
        starImageView.image = UIImage(systemName: "star.fill")
        starImageView.tintColor = .black
        return starImageView
    }()
    
    private lazy var ratingStackView: UIStackView = {
        var ratingStackView = UIStackView()
        ratingStackView.spacing = 8
        ratingStackView.alignment = .fill
        ratingStackView.distribution = .equalSpacing
        ratingStackView.addArrangedSubview(starImageView)
        ratingStackView.addArrangedSubview(ratingLabel)
        ratingStackView.addArrangedSubview(reviewsLabel)
        return ratingStackView
    }()
    
    private lazy var activityIndicatior: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.color = .gray
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
        return activityIndicator
    }()
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(mainImageView)
        contentView.addSubview(ratingStackView)
        mainImageView.addSubview(activityIndicatior)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        // отключаем выделение ячейки
    }
    
    // MARK: - Public Methods
    func configure(with imageURL: String) {
        if imageURL != "" {
            RecipeManager.shared.fetchImage(from: imageURL) { [weak self] result in
                switch result {

                case .success(let imageData):
                    self?.mainImageView.image = UIImage(data: imageData)
                    self?.activityIndicatior.stopAnimating()
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
    
    // MARK: - Private Methods
    private func setupConstraints() {
        mainImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.height.equalTo(190)
        }
        
        ratingStackView.snp.makeConstraints { make in
            make.top.equalTo(mainImageView.snp.bottom).offset(15)
            make.left.equalToSuperview().offset(16)
            make.bottom.equalToSuperview().offset(-5)
        }
        
        activityIndicatior.snp.makeConstraints { make in
            make.centerX.equalTo(mainImageView.snp.centerX)
            make.centerY.equalTo(mainImageView.snp.centerY)
        }
    }
}
