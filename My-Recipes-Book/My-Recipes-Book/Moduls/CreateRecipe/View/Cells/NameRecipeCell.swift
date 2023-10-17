//
//  NameRecipeCell.swift
//  My-Recipes-Book
//
//  Created by Михаил Болгар on 10.09.2023.
//

import Foundation
import UIKit

protocol NameRecipeCellDelegate: AnyObject {
    func didEndEditingWithName(_ name: String)
}

final class NameRecipeCell: UITableViewCell {
    
    static let cellID = String(describing: NameRecipeCell.self)
    
    var delegate: NameRecipeCellDelegate?
    
    // MARK: - UI Properties
    private lazy var mainView: UIView = {
        var mainView = UIView()
        mainView.backgroundColor = .systemBackground
        mainView.layer.borderColor = UIColor.systemRed.cgColor
        mainView.layer.borderWidth = 1
        mainView.layer.cornerRadius = 10
        return mainView
    }()
    
    lazy var mainTextField: UITextField = {
        var mainTextField = UITextField()
        mainTextField.placeholder = "Recipe name"
        mainTextField.autocorrectionType = .no
        mainTextField.delegate = self
        return mainTextField
    }()
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViewComponents()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    
    private func setupViewComponents() {
        contentView.addSubview(mainView)
        mainView.addSubview(mainTextField)
    }
    
    private func setupConstraints() {
        mainView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.right.equalToSuperview().offset(-16)
            make.left.equalToSuperview().offset(16)
            make.bottom.equalToSuperview()
            
        }
        
        mainTextField.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview()
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
}

// MARK: - UITextFieldDelegate
extension NameRecipeCell: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let name = textField.text {
            delegate?.didEndEditingWithName(name)
        }
    }
}
