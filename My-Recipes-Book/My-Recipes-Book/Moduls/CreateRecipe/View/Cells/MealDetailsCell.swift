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

    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(mainView)
        mainView.addSubview(iconView)
        iconView.addSubview(iconImageView)
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Override Methods
    override func setSelected(_ selected: Bool, animated: Bool) {
        // отключаем выделение ячейки
    }
    
    // MARK: - Public Methods
    func configure(_ imageName: String) {
        iconImageView.image = UIImage(systemName: imageName)
    }
    
    // MARK: - Private Methods
    private func setupConstraints() {
        mainView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(5)
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
    }
    
}
