//
//  CreateRecipeFooterView.swift
//  My-Recipes-Book
//
//  Created by Kirill Taraturin on 16.10.2023.
//

import UIKit

class CreateRecipeFooterView: UITableViewHeaderFooterView {
    
    static let reuseID = String(describing: CreateRecipeFooterView.self)
    
    // MARK: - Private UI Properties
    private lazy var addIngredientButton: UIButton = {
        var button = UIButton(type: .custom)
        button.setTitle("Add new ingredient", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont(name: "Poppins-SemiBold", size: 16)
        button.addTarget(
            self,
            action: #selector(addIngredientButtonDidTapped),
            for: .touchUpInside
        )
        button.addTarget(
            self,
            action: #selector(buttonPressed),
            for: .touchDown
        )
        button.addTarget(
            self,
            action: #selector(buttonReleased),
            for: [.touchUpInside, .touchUpOutside, .touchCancel]
        )
        return button
    }()
    
    private lazy var plusImageView: UIImageView = {
        var plusIV = UIImageView()
        plusIV.image = UIImage(named: "plus")
        plusIV.tintColor = .black
        return plusIV
    }()
    
    
    // MARK: - Init
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        addSubview(addIngredientButton)
        addIngredientButton.addSubview(plusImageView)
        setupConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Actions
    @objc private func addIngredientButtonDidTapped() {
        
    }
    
    // MARK: - Click effect methods
    @objc func buttonPressed() {
        UIView.animate(withDuration: 0.1) {
            // Уменьшаем размер кнопки на 10% для эффекта нажатия
            self.addIngredientButton.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        }
    }

    @objc func buttonReleased() {
        UIView.animate(withDuration: 0.1) {
            // Возвращаем кнопку к исходному размеру
            self.addIngredientButton.transform = CGAffineTransform.identity
        }
    }
    
    // MARK: - Private Methods
    private func setupConstraints() {
        plusImageView.snp.makeConstraints { make in
            make.centerY.equalTo(addIngredientButton.snp.centerY)
            make.left.equalTo(addIngredientButton.snp.left)
            make.width.equalTo(20)
            make.height.equalTo(20)
        }
        
        addIngredientButton.snp.makeConstraints { make in
            make.centerY.equalTo(self.snp.centerY)
            make.left.equalTo(self.snp.left).offset(16)
            make.right.equalTo(self.snp.right).offset(-140)
        }
    }
}
