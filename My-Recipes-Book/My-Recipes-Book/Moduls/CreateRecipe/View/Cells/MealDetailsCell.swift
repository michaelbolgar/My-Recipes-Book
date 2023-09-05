//
//  MealDetailsCell.swift
//  My-Recipes-Book
//
//  Created by Kirill Taraturin on 04.09.2023.
//

import UIKit

final class MealDetailsCell: UITableViewCell {
    
    // MARK: - UI Properties
    private lazy var mainView: UIView = {
        var mainView = UIView()
        mainView.backgroundColor = #colorLiteral(red: 0.9450979829, green: 0.9450979829, blue: 0.9450979829, alpha: 1)
        mainView.layer.cornerRadius = 12
        return mainView
    }()
    
    private lazy var iconView: UIView = {
        var iconView = UIView()
        iconView.backgroundColor = .white
        iconView.layer.cornerRadius = 12
        return iconView
    }()
    
    lazy var iconImageView: UIImageView = {
       var iconImageView = UIImageView()
        iconImageView.image = UIImage(systemName: "person.2.fill")
        iconImageView.tintColor = .black
        return iconImageView
    }()
    
    lazy var nameDetailLabel: UILabel = {
        var nameDetailLabel = UILabel()
        nameDetailLabel.font = UIFont(name: "Poppins-SemiBold", size: 16)
        nameDetailLabel.textColor = .black
        return nameDetailLabel
    }()
    
    private lazy var arrowButton: UIButton = {
        var arrowButton = UIButton(type: .system)
        arrowButton.setImage(UIImage(systemName: "arrow.right"), for: .normal)
        arrowButton.tintColor = .black
        return arrowButton
    }()
    
    lazy var detailLabel: UILabel = {
        var detailLabel = UILabel()
        detailLabel.font = UIFont(name: "Poppins-Regular", size: 14)
        detailLabel.textColor = UIColor(red: 0.569, green: 0.569, blue: 0.569, alpha: 1)
        detailLabel.text = "??"
        return detailLabel
    }()
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(mainView)
        mainView.addSubview(iconView)
        iconView.addSubview(iconImageView)
        mainView.addSubview(nameDetailLabel)
        mainView.addSubview(arrowButton)
        mainView.addSubview(detailLabel)
                
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func showPickerView() {
        
    }
    
    // MARK: - Public Methods
    func configure(_ imageName: String, detail: String, detailLabel: String) {
        iconImageView.image = UIImage(systemName: imageName)
        nameDetailLabel.text = detail
        self.detailLabel.text = detailLabel
    }
    
    // MARK: - Private Methods
    private func setupConstraints() {
        mainView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(15)
            make.bottom.equalToSuperview().offset(-5)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
        }
        
        iconView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(16)
            make.width.equalTo(38)
            make.height.equalTo(38)
        }
        
        iconImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(9)
            make.bottom.equalToSuperview().offset(-9)
            make.right.equalToSuperview().offset(-9)
            make.left.equalToSuperview().offset(9)
        }
        
        nameDetailLabel.snp.makeConstraints { make in
            make.left.equalTo(iconView.snp.right).offset(16)
            make.centerY.equalTo(iconView.snp.centerY)
        }
        
        arrowButton.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-16)
            make.centerY.equalToSuperview()
        }
        
        detailLabel.snp.makeConstraints { make in
            make.right.equalTo(arrowButton.snp.left).offset(-16)
            make.centerY.equalToSuperview()
        }

    }
}

