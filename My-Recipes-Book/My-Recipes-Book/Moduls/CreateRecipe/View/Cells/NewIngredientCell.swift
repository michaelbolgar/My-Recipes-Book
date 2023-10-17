//
//  NewIngredientCellDelegate.swift
//  My-Recipes-Book
//
//  Created by Михаил Болгар on 10.09.2023.
//

import Foundation
import UIKit

protocol NewIngredientCellDelegate: AnyObject {
    func didTapDeleteButton(cell: NewIngredientCell)
}

final class NewIngredientCell: UITableViewCell {
    
    static let cellID = String(describing: NewIngredientCell.self)
    
    // MARK: Public Properties
    var delegate: NewIngredientCellDelegate?
    
    // MARK: - Public UI Properties
    private lazy var nameTextField: UITextField = {
        var nameTF = UITextField()
        nameTF.placeholder = "Item name"
        nameTF.delegate = self
        nameTF.autocorrectionType = .no
        return nameTF
    }()
    
    private lazy var quantityTextField: UITextField = {
        var quantityTF = UITextField()
        quantityTF.placeholder = "Quantity"
        quantityTF.delegate = self
        quantityTF.autocorrectionType = .no
        return quantityTF
    }()
    
    // MARK: - Private UI Properties
    private lazy var mainView: UIView = {
        var mainView = UIView()
        return mainView
    }()
    
    private lazy var itemNameView: UIView = {
        var itemNameView = UIView()
        itemNameView.layer.borderColor = UIColor.systemGray5.cgColor
        itemNameView.layer.borderWidth = 1
        itemNameView.layer.cornerRadius = 10
        itemNameView.backgroundColor = .white
        return itemNameView
    }()
    
    private lazy var quantityView: UIView = {
        var quantityView = UIView()
        quantityView.layer.borderColor = UIColor.systemGray5.cgColor
        quantityView.layer.borderWidth = 1
        quantityView.layer.cornerRadius = 10
        quantityView.backgroundColor = .white
        return quantityView
    }()
    
    private lazy var deleteButton: UIButton = {
        var mainButton = UIButton(type: .system)
        mainButton.setImage(UIImage(named: "minus"), for: .normal)
        mainButton.tintColor = .black
        mainButton.addTarget(self, action: #selector(deleteButtonTapped), for: .touchUpInside)
        return mainButton
    }()
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Methods
    func configure(with ingredient: NewIngredient) {
        nameTextField.text = ingredient.name
        quantityTextField.text = ingredient.quantity
    }
    
    func getNameTextFieldText() -> String {
        guard let text = nameTextField.text else { return "No value"}
        return text
    }
    
    func getQuantityTextFieldText() -> String {
        guard let text = quantityTextField.text else { return "No value"}
        return text
    }
    
    // MARK: - Private Actions
    @objc private func deleteButtonTapped() {
        delegate?.didTapDeleteButton(cell: self)
    }
    
    // MARK: - Private Methods
    private func addViews() {
        contentView.addSubview(mainView)
        mainView.addSubview(itemNameView)
        mainView.addSubview(quantityView)
        mainView.addSubview(deleteButton)
        itemNameView.addSubview(nameTextField)
        quantityView.addSubview(quantityTextField)
    }
    
    private func setupConstraints() {
        mainView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        itemNameView.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.top.equalToSuperview().offset(15)
            make.bottom.equalToSuperview().offset(-5)
            make.width.equalTo(160)
        }
        
        quantityView.snp.makeConstraints { make in
            make.left.equalTo(itemNameView.snp.right).offset(15)
            make.top.equalToSuperview().offset(15)
            make.bottom.equalToSuperview().offset(-5)
            make.width.equalTo(110)
        }
        
        deleteButton.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-16)
            make.left.equalTo(quantityView.snp.right).offset(15)
            make.centerY.equalTo(quantityView.snp.centerY)
            make.top.equalTo(quantityView.snp.top).offset(5)
            make.bottom.equalTo(quantityView.snp.bottom).offset(-5)
        }
        
        nameTextField.snp.makeConstraints { make in
            make.left.equalTo(itemNameView.snp.left).offset(16)
            make.right.equalToSuperview()
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        quantityTextField.snp.makeConstraints { make in
            make.left.equalTo(quantityView.snp.left).offset(16)
            make.right.equalToSuperview()
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
}

// MARK: - UITextFieldDelegate
extension NewIngredientCell: UITextFieldDelegate {
}
