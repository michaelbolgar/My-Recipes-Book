//
//  ButtonCell.swift
//  My-Recipes-Book
//
//  Created by Михаил Болгар on 10.09.2023.
//

import UIKit

final class CreateButtonCell: UITableViewCell {
    
    // MARK: - Static Properties
    static let cellID = String(describing: CreateButtonCell.self)
    
    // MARK: - Closures
    var actionButton: (() -> Void)?
    
    // MARK: - Private UI Properties
    private lazy var createRecipeButton: UIButton = {
        var createButton = UIButton(type: .system)
        createButton.backgroundColor = Palette.redPrimary50
        createButton.setTitle("Create recipe", for: .normal)
        createButton.titleLabel?.font = UIFont.poppins(weight: .semibold, size: 16)
        createButton.tintColor = .white
        createButton.layer.cornerRadius = 8
        createButton.addTarget(
            self,
            action: #selector(createButtonDidTapped),
            for: .touchUpInside
        )
        return createButton
    }()
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(createRecipeButton)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Actions
    @objc private func createButtonDidTapped() {
        actionButton?()
    }
    
    // MARK: - Private Methods
    private func setupConstraints() {
        createRecipeButton.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.top.equalToSuperview().offset(17)
            make.bottom.equalToSuperview().offset(-5)
        }
    }
}
