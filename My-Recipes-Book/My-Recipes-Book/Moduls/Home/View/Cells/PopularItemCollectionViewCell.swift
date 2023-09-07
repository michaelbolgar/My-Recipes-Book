//
//  PopularItemCollectionViewCell.swift
//  My-Recipes-Book
//
//  Created by Дмитрий Лоренц on 29.08.2023.
//

import UIKit
import Kingfisher

class PopularItemCollectionViewCell: UICollectionViewCell {
    //MARK: - Variables
    static let reuseID = "PopularItemCollectionViewCell"
    
    private lazy var grayView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.backgroundColor = Palette.neutral10
        return view
    }()
    
    private lazy var dishImageView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .blue
        view.clipsToBounds = true
        view.layer.cornerRadius = view.frame.height / 2
        return view
    }()
    
    private lazy var bookmarkImageView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .blue
        view.layer.cornerRadius = view.frame.height / 2
        return view
    }()
    
    private lazy var timeValueLabel: UILabel = {
        let label = UILabel()
        label.text = "5 Mins"
        label.textColor = Palette.neutral100
        label.font = .poppins(weight: .bold, size: 12)
        return label
    }()
    
    private lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.text = "Time"
        label.textColor = Palette.neutral30
        label.font = .poppins(weight: .regular, size: 12)
        return label
    }()
    
    private lazy var mainLabel: UILabel = {
        let label = UILabel()
        label.text = "Chicken and Vegetable wrap"
        label.numberOfLines = 0
        label.textColor = Palette.neutral100
        label.font = .poppins(weight: .bold, size: 14)
        return label
    }()
    
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Methods
    private func setViews() {
        contentView.addSubview(grayView)
        contentView.addSubview(dishImageView)
        contentView.addSubview(timeValueLabel)
        contentView.addSubview(timeLabel)
        contentView.addSubview(mainLabel)
        contentView.addSubview(bookmarkImageView)
    }
    
    private func setConstraints() {
        grayView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.height.equalToSuperview().dividedBy(231.0 / 176.0)
        }
        
        dishImageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.width.equalToSuperview().dividedBy(150.0 / 110.0)
            make.height.equalTo(dishImageView.snp.width)
            make.centerX.equalToSuperview()
        }
        
        timeValueLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(12)
            make.bottom.equalToSuperview().inset(11)
        }
        
        timeLabel.snp.makeConstraints { make in
            make.leading.equalTo(timeValueLabel)
            make.bottom.equalTo(timeValueLabel.snp.top).inset(4)
        }
        
        bookmarkImageView.snp.makeConstraints { make in
            make.bottom.equalTo(-11)
            make.trailing.equalTo(-12)
            make.width.equalToSuperview().dividedBy(150.0 / 24)
            make.height.equalTo(bookmarkImageView.snp.width)
            
        }
        
        mainLabel.snp.makeConstraints { make in
            //make.center.equalTo(grayView)
            make.leading.equalTo(timeValueLabel)
            make.trailing.equalTo(bookmarkImageView)
            make.top.equalTo(dishImageView.snp.bottom).inset(-8)
            make.bottom.equalTo(timeLabel.snp.top).inset(-8).priority(.high)
        }
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        dishImageView.layer.cornerRadius = dishImageView.frame.height / 2
    }
    
    func setupCell(with recipe: Results?) {
        dishImageView.imageFromURL(recipe?.image ?? "", placeHolder: nil)
        timeValueLabel.text = "\(recipe?.cookingMinutes ?? 0)"
        mainLabel.text = recipe?.title
    }
}
