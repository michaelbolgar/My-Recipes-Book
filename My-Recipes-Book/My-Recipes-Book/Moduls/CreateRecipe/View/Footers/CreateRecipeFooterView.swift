//
//  CreateRecipeFooterView.swift
//  My-Recipes-Book
//
//  Created by Kirill Taraturin on 16.10.2023.
//

import UIKit

protocol CreateRecipeFooterViewDelegate {
    func addNewIngredient()
}

final class CreateRecipeFooterView: UITableViewHeaderFooterView {
    
    // MARK: - Static Properties
    static let reuseID = String(describing: CreateRecipeFooterView.self)
    
    // MARK: - Public Properties
    var delegate: CreateRecipeFooterViewDelegate?
    
    // MARK: - Private UI Properties
    private lazy var ingredientButton: UIButton = {
        var button = UIButton()
        
        let imageView = UIImageView()
        imageView.image = UIImage(named: "plus1")
        imageView.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        imageView.contentMode = .scaleAspectFit
        
        let label = UILabel()
        label.text = "Add new ingredient"
        label.textColor = .black
        label.font = UIFont(name: "Poppins-SemiBold", size: 16)
        
        button.addSubview(imageView)
        button.addSubview(label)
        
        imageView.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.centerY.equalTo(button.snp.centerY)
            make.height.equalTo(30)
            make.height.equalTo(30)
        }
        
        label.snp.makeConstraints { make in
            make.left.equalTo(imageView.snp.right).offset(8)
            make.centerY.equalTo(button.snp.centerY)
        }
        
        button.addTarget(
            self,
            action: #selector(addIngredientButtonDidTapped),
            for: .touchUpInside
        )
        
        return button
    }()
    
    // MARK: - Init
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        addSubview(ingredientButton)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Actions
    @objc private func addIngredientButtonDidTapped() {
        delegate?.addNewIngredient()
    }
    
    // MARK: - Private Methods
    private func setupConstraints() {
        ingredientButton.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.top.equalToSuperview().offset(10)
            make.width.equalTo(200)
        }
    }
}
