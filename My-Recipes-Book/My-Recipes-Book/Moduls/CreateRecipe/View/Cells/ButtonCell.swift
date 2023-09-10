//
//  ButtonCell.swift
//  My-Recipes-Book
//
//  Created by Михаил Болгар on 10.09.2023.
//

import Foundation
import UIKit

final class ButtonCell: UITableViewCell {

    // MARK: - Private UI Properties
    private lazy var createRecipeButton: UIButton = {
        var createButton = UIButton(type: .system)
        createButton.backgroundColor = #colorLiteral(red: 0.8841535449, green: 0.2446581125, blue: 0.2408704162, alpha: 1)
        createButton.setTitle("Create recipe", for: .normal)
        createButton.titleLabel?.font = UIFont(name: "Poppins-SemiBold", size: 16)
        createButton.tintColor = .white
        createButton.layer.cornerRadius = 5
        return createButton
    }()

    // MARK: - Public UI Properties

    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(createRecipeButton)
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
