//
//  CreateRecipeSectionHeader.swift
//  My-Recipes-Book
//
//  Created by Kirill Taraturin on 16.10.2023.
//

import UIKit

final class CreateRecipeSectionHeader: UITableViewHeaderFooterView {
    
    // MARK: - Static Properties
    static let reuseID = String(describing: CreateRecipeSectionHeader.self)
    
    // MARK: - Private UI Properties
    private lazy var titleLabel: UILabel = {
        var title = UILabel()
        title.numberOfLines = 0
        title.lineBreakMode = .byWordWrapping
        title.textColor = .black
        title.font = UIFont(name: "Poppins-SemiBold", size: 24)
        return title
    }()
    
    // MARK: - Init
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        contentView.addSubview(titleLabel)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Methods
    func configure(with title: String, and fontSize: Int) {
        titleLabel.text = title
        titleLabel.font = UIFont(name: "Poppins-SemiBold", size: CGFloat(fontSize))
    }
    
    // MARK: - Private Methods
    private func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.left.equalToSuperview().offset(16)
        }
    }
}
