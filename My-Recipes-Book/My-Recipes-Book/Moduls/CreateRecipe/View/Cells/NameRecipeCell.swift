//
//  NameRecipeCell.swift
//  My-Recipes-Book
//
//  Created by Kirill Taraturin on 03.09.2023.
//

import UIKit

final class NameRecipeCell: UITableViewCell {
    
    // MARK: - UI Properties
    private lazy var mainView: UIView = {
        var mainView = UIView()
        mainView.backgroundColor = .white
        mainView.layer.borderColor = UIColor.systemRed.cgColor
        mainView.layer.borderWidth = 1
        mainView.layer.cornerRadius = 10
        return mainView
    }()
    
    lazy var mainTextField: UITextField = {
        var mainTextField = UITextField()
        mainTextField.placeholder = "type name recipe"
        mainTextField.text = "Naija lunch box ideas for work|"
        mainTextField.autocorrectionType = .no
        mainTextField.delegate = self
        return mainTextField
    }()
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(mainView)
        mainView.addSubview(mainTextField)
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
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
}
