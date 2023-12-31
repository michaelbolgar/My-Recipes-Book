//
//  NameRecipeCell.swift
//  My-Recipes-Book
//
//  Created by Михаил Болгар on 10.09.2023.
//

import UIKit

final class NameRecipeCell: UITableViewCell {
    
    // MARK: - Static Properties
    static let cellID = String(describing: NameRecipeCell.self)
    
    // MARK: - UI Properties
    private lazy var mainView: UIView = {
        var mainView = UIView()
        mainView.backgroundColor = .systemBackground
        mainView.layer.borderColor = Palette.redPrimary50.cgColor
        mainView.layer.borderWidth = 1
        mainView.layer.cornerRadius = 10
        return mainView
    }()
    
    private lazy var mainTextField: UITextField = {
        var mainTextField = UITextField()
        mainTextField.placeholder = "Recipe name"
        mainTextField.autocorrectionType = .no
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

    // MARK: - Public Properties
    func getMainTextFieldText() -> String {
        guard let text = mainTextField.text else { return "No value" }
        return text
    }
    
    func resetTextField() {
        mainTextField.text = ""
    }
    
    func transferDelegate(delegate: UITextFieldDelegate) {
        mainTextField.delegate = delegate
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
