//
//  MainImageCell.swift
//  My-Recipes-Book
//
//  Created by Kirill Taraturin on 03.09.2023.
//

import UIKit

final class RecipeImageCell: UITableViewCell {
    
    // MARK: - UI Properties
    lazy var recipeImageView: UIImageView = {
        var recipeImageView = UIImageView()
        recipeImageView.layer.cornerRadius = 10
        recipeImageView.clipsToBounds = true
        recipeImageView.image = UIImage(named: "testImage")
        
        return recipeImageView
    }()
    
    lazy var editButton: UIButton = {
        var editButton = UIButton(type: .system)
        editButton.backgroundColor = .white
        editButton.tintColor = .black
        editButton.setImage(UIImage(named: "Edit1"), for: .normal)
        editButton.layer.cornerRadius = 15
        editButton.clipsToBounds = true
        return editButton
    }()
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(recipeImageView)
        contentView.addSubview(editButton)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    private func setupConstraints() {
        recipeImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.bottom.equalToSuperview().offset(-20)
        }
        
        editButton.snp.makeConstraints { make in
            make.top.equalTo(recipeImageView.snp.top).offset(10)
            make.right.equalTo(recipeImageView.snp.right).offset(-10)
            make.width.equalTo(30)
            make.height.equalTo(30)
        }
    }
    
}
